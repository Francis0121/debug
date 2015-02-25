<%--
    User: pi Date: 15. 2. 3 Time: 오후 2:50
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<section class="nornen_section_wrap section_top">
    
    <section class="nornen_section">

        <article class="nornen_content_type01">
    
            <header>
                <h2>Get Started : Basic volume rendering web application</h2>
            </header>
    
            <div class="content">
                <p>이 페이지는, 가장 기본적인 볼륭가시화 웹 시스템을 구현하는 방법을 설명한 페이지 입니다.</p>
                <p>웹 시스템을 이용하기 위해서는 node.js와 node-gyp 가 설치 되어 있어야 하며 볼륨 가시화를 수행할 수 있는 크기의 메모리를 가진 NVIDIA 그래픽 카드와 CUDA가 설치되어 있어야 합니다.</p>
                <p>가장 기본적인 설치과정을 설명을 해두었지만 기본적인 지식은 기반이 되어 있어야 합니다.</p>
            </div>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Computer Environment</h2>
            </header>
            
            <div class="content">
                <p>
                    <span class="head">- OS</span> : <span class="content">Ubuntu 12.04.5 LTS 32bit</span>
                </p>
                <p>
                    <span class="head">- CPU</span> : <span class="content">i3-3220</span>
                </p>
                <p>
                    <span class="head">- Memory</span> : <span class="content">4GB</span>
                </p>
                <p>
                    <span class="head">- Graphic Card</span> : <span class="content">GTX 760</span>
                </p>
            </div>

            <header>
                <h2>Library Version</h2>
            </header>
            
            <div class="content">
                <p>
                    <span class="head">- CUDA</span> : <span class="content">6.0.37_linux_32</span>
                </p>
                <p>
                    <span class="head">- node.js</span> : <span class="content">0.10.35</span>
                </p>
            </div>
            
        </article>

        <article class="nornen_content_type01">

            <header>
                <h2>Install Ubuntu</h2>
            </header>

            <div class="content">
                <p>1. <a class="link" href="http://www.ubuntu.com/">Ubuntu 홈페이지</a>에서 os를 다운로드 받아서, 설치합니다.</p>
                <p>- <a class="download" href="http://www.ubuntu.com/download/desktop/">최신버전</a></p>
                <p>- <a class="download" href="http://ftp.funet.fi/pub/Linux/INSTALL/Ubuntu/dvd-releases/releases/12.04.5/release/">12.04.5</a></p>
                
                <p>2. Ubuntu를 처음 설치한 경우에는 ubuntu `apt-get update`와 `apt-get upgrade`를 수행합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">apt-get</span> update `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/0_1.png"/>
                
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">apt-get</span> upgrade `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/0_2.png"/>
                
                <p>3. Ubuntu에 대한 버전 확인은 `lsb_release -a` 로 확인 할 수 있습니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` lsb_release -a `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/0_3.png"/>
            </div>

        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install node.js</h2>
            </header>
            
            <div class="content">
                <p>1. node.js를 설치하려면 `g++`과 `curl`이 설치되어 있어야 합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">apt-get</span> install g++ curl `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_1.png"/>
                
                <p>2. <a class="link" href="http://www.nodejs.org/">node.js</a> 홈페이지를 방문하여 node.js 압축파일를 다운받습니다.</p>
                <p>- <a class="download" href="http://www.nodejs.org/download/">최신버전</a></p>
                <p>- <a class="download" href="http://nodejs.org/dist/v0.10.35/">v0.10.35</a></p>
                
                <p>3. Download 받은 폴더에서 해당 파일에 대한 압축을 풀어 놓습니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">tar</span> -xvzf node-v0.10.35.tar.gz `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_2.png"/>
                
                <p>4. node.js 압축을 푼 폴더에서 `configure`를 실행시켜줍니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` ./configure `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_3.png"/>
                
                <p>5. 해당 폴더에서 `make` 명령어를 실행시켜줍니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">make</span> `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_4.png"/>
                
                <p>6. 해당 폴더에서 `make install` 명령어를 실행시켜줍니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">make</span> install`
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_5.png"/>
                
                <p>7. 설치가 완료되면 `npm -version`, `nnode --version` 으로 node.js가 설치되어 있음을 확인할 수 있습니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">node</span> --version `
                    </span>
                </p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">npm</span> -version `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/1_6.png"/>
                
            </div>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install node-gyp</h2>
            </header>
            
            <div class="content">
                <p>1. node-gyp는 nodejs의 c++ module을 컴파일 시켜주는 도구 입니다. 해당 프로젝트는 c++ module를 구현하여 사용하기 때문에 해당 libarary를 설치해야 합니다.</p>
                
                <p>2. node-gyp를 전역으로 설치합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">npm</span> install -g node-gyp `
                    </span>
                </p>
            </div>
            <img src="${cp}/resources/image/started/2_1.png"/>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install jpeg & png library</h2>
            </header>
            
            <div class="content">
                <p>1. 볼륨 랜더링을 통해 나온 Byte를 Image로 인코딩하기 위해서 해당 라이브러리를 사용하게 됩니다. 따라서 JPEG과 PNG 라이브러리를 설치해야합니다.</p>
                
                <p>2. Jpeg library를 설치합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">apt-get</span> install libjpeg-dev`
                    </span>
                </p>
                <img src="${cp}/resources/image/started/3_1.png"/>
                
                <p>3. Png library를 설치합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">apt-get</span> install libpng-dev`
                    </span>
                </p>
                <img src="${cp}/resources/image/started/3_2.png"/>
            </div>
            
        </article>

        <article class="nornen_content_type01">

            <header>
                <h2>Install CUDA 6.0</h2>
            </header>

            <div class="content">
                <p>1. <a class="link" href="https://developer.nvidia.com/cuda-zone">CUDA 홈페이지</a>를 접속하여 CUDA를 설치합니다.</p>
                <p>- <a class="download" href="https://developer.nvidia.com/cuda-downloads">최신버전</a></p>
                <p>- <a class="download" href="https://developer.nvidia.com/cuda-toolkit-60">CUDA 6.0</a></p>
                
                <p>2. CUDA 다운로드시 해당 OS와 Bit수에 맞는 버전을 다운로드 받아야 합니다.</p>
                
                <p>3. 다운로드 받을 때에 RUN 파일을 다운로드 받습니다.</p>
                
                <p>4. CUDA 설치는 Graphic카드의 사용을 중지시킨뒤 사용을 해야합니다. 따라서 <b>` Ctrl + Alt + F1 `</b> 우분투 커멘드 창으로 이동합니다.</p>
                
                <p>5. 그 이후 설치 되어 있는 서비스중 lightdm 을 중지시킵니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">service</span> lightdm stop `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/4_1.png"/>
                
                <p>6. 만약 lightdm을 중지시키고 설치가 되지 않는다면 아래의 절차를 수행합니다.</p>
                <p class="command">
                    <label>1.</label> 
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">vim</span> /etc/default/grub `
                    </span>
                    - Text Editor를 사용하여 해당 정보를 수정합니다.
                    <br/>
                    <label>2.</label> 
                    <span class="text">` GRUB_CMDLINE_LINUX_DEFAULT = ... `</span>
                    - 해당 라인에 <span class="text">` <span class="sudo">nomodeset</span> `</span> 을 추가합니다.<br/>
                    <label>3.</label> 
                    <span class="text">
                        ` <span class="sudo">sudo</span> <span class="emphasize">update-grub</span> `
                    </span>
                    - 저장을 한뒤 해당 명령어를 칩니다. 또는 <span class="text">` <span class="sudo">sudo</span> <span class="emphasize">reboot</span> -h now `</span> 을 하여 재부팅을 합니다
                </p>
                <img src="${cp}/resources/image/started/4_2.png"/>
                <img src="${cp}/resources/image/started/4_3.png"/>
                <img src="${cp}/resources/image/started/4_4.png"/>
                <img src="${cp}/resources/image/started/4_5.png"/>
                
                <p>7. 이후 run 파일의 경우 실행할 수 있는 권한이 없는데 해당되는 권한을 부여합니다.</p>
                <p class="command">
                    <label>Command</label>
                    <span class="text">
                        ` <span class="emphasize">chmod</span> 755 cuda_6.0.37_linux_32.run `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/4_6.png"/>
                <img src="${cp}/resources/image/started/4_7.png"/>
                <img src="${cp}/resources/image/started/4_8.png"/>
                
                <p>8. 해당파일을 실행 시킵니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` ./cuda_6.0.37_linux_32.run `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/4_9.png"/>
                
                <p>9. 설치가 정상적으로 수행되게 되면 완료합니다.</p>
                
            </div>

        </article>

        <article class="nornen_content_type01">
            
            <header>
                <h2>Set environment path & Add library</h2>
            </header>
            
            <div class="content">
                <p>1. CUDA 가 설치되었더라도 `nvcc`가 실행이 되지 않을 수 있기 때문에 PATH 환경변수를 추가시켜줘야 합니다.</p>
                <p class="command">
                    <label>path</label>
                    <span class="text">
                        ` <span class="emphasize">export</span> PATH=$PATH:/usr/local/cuda/bin `
                    </span>
                    <br/>
                    <span class="text">
                        ` <span class="emphasize">export</span> LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib
                    </span>
                </p>
                <img src="${cp}/resources/image/started/5_1.png"/>
                
                <p>2. node-gyp를 이용하여 컴파일할 때에 `helper_math.h`이 include 되어야 합니다. 따라서 CUDA 설치 경로 폴더에 해당되는 파일을 넣어줍니다.</p>
                <p>- <a class="download" href="http://www.cse.uaa.alaska.edu/~ssiewert/a490dmis_code/CUDA/cuda_work/samples/common/inc/helper_math.h">helper_math.h</a></p>
                <img src="${cp}/resources/image/started/5_4.png"/>
            </div>
            
        </article>
        
        <article class="nornen_content_type01">

            <header>
                <h2>Install nornenjs</h2>
            </header>

            <div class="content">
                <p>1. Nornenjs 프로젝트를 npm을 통하여 설치합니다.</p>
                <p class="command">
                    <label>cmd</label> 
                    <span class="text">
                        ` <span class="emphasize">npm</span> install nornenjs `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/6_1.png"/>
                
                <p>2. CUDA 소스를 Compile 하기 위해서 nornenjs/src-cuda 로 이동합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">cd</span> ./nornenjs/src-cuda `
                    </span>
                </p>
                
                <p>3. `nvcc` 를 이용해서 CUDA 파일을 컴파일 합니다.</p>
                <p class="command">
                    <label>cmd</label>
                    <span class="text">
                        ` <span class="emphasize">nvcc</span> volume.cu <span class="emphasize">-ptx</span> `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/5_2.png"/>
                <img src="${cp}/resources/image/started/5_3.png"/>
                
                <p>4. Example 소스가 `nornenjs/example` 폴더에 존재함으로 해당 폴더로 이동합니다.</p>
                <p class="command">
                    <label>cmd</label> 
                    <span class="text">
                        ` <span class="emphasize">cd</span> ./nornenjs/example `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/6_2.png"/>
                
                <p>5. 해당 폴더에 www 파일을 실행시킵니다.</p>
                <p class="command">
                    <label>cmd</label> 
                    <span class="text">
                        ` <span class="emphasize">node</span> www`
                    </span>
                </p>
                <img src="${cp}/resources/image/started/6_3.png"/>
                
                <p>6. 브라우저를 통하여 접속해서 확인하면 아래와 같은 화면이 뜨게됩니다.</p>
                <p class="command">
                    <label>url</label>
                    <span class="text">
                        ` http://localhost:5000 `
                    </span>
                </p>
                <img src="${cp}/resources/image/started/6_4.png"/>
            </div>

        </article>

        <br>
        <br>
        <br>
        
    </section>
        
</section>

<%@ include file="../layout/foot.jspf" %>