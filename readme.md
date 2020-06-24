# docker wechat
* 启动

        docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -e XMODIFIERS=@im=ibus -e GTK_IM_MODULE=ibus -e QT_IM_MODULE=ibus -e GID="$(id -g)" -e UID="$(id -u)" --privileged --ipc=host -exec -it 1di0t/deepin-wine bash
        ./start_wechat.sh

* 直接运行，会报错

        错误信息：The name com.deepin.dde.TrayManager was not provided by any .service files。不知道怎么解决。ibus输入法，也不能输入

        docker run --rm -i -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -e XMODIFIERS=@im=ibus -e GTK_IM_MODULE=ibus -e QT_IM_MODULE=ibus -e GID="$(id -g)" -e UID="$(id -u)" --privileged --ipc=host deepin-wine
