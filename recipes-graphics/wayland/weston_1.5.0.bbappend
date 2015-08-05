FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = "\
     file://weston_ini.patch \
     file://weston.service \
     file://GDP_AM_Button.png \
     file://GDP_Background.png \
     file://GDP_Browser_Button.png \
     file://start_am-poc.sh \
     file://start_browser-poc.sh \
     file://0001-configure.ac-check-for-libsystemd-instead-of-compat-.patch \
     "

inherit systemd
DEPENDS_append = " systemd"

do_install_append() {
    install -m644 ${WORKDIR}/GDP*.png ${D}/usr/share/weston
    mkdir -p ${D}/${bindir}/
    cp ${WORKDIR}/start_am-poc.sh ${D}/${bindir}
    cp ${WORKDIR}/start_browser-poc.sh ${D}/${bindir}
    mkdir -p ${D}${systemd_unitdir}/system/
    cp ${WORKDIR}/weston.service ${D}${systemd_unitdir}/system/
    mkdir -p ${D}${systemd_unitdir}/system/multi-user.target.wants/
    ln -sf /lib/systemd/system/weston.service ${D}/${systemd_unitdir}/system/multi-user.target.wants/weston.service
}

FILES_${PN} += " \
                ${systemd_unitdir}/system/* \
               "
