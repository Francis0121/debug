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
                <p>In this guide we`ll create a basic volume rendering web application. It requires almost no basic prior knowledge of <b>Node.JS, Node-gyp, NVIDIA CUDA</b>, so it`s ideal for users of all knowledge levels.</p>
            </div>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Computer Environment</h2>
            </header>
            
            <div class="content">
                <p>OS : Ubuntu 12.04.5 LTS 32bit</p>
                <p>CPU : i3-3220</p>
                <p>Memory : 4GB</p>
                <p>Graphic Card : GTX 760</p>
            </div>

            <header>
                <h2>Library Version</h2>
            </header>
            
            <div class="content">
                <p>CUDA : 6.0.37_linux_32</p>
                <p>node.js : 0.10.35</p>
            </div>
            
        </article>

        <article class="nornen_content_type01">

            <header>
                <h2>Install Ubuntu</h2>
            </header>

            <div class="content">
                <p>1. Ubuntu를 처음 설치했다면 ubuntu `apt-get`에 대한 update와 upgrade를 수행합니다.</p>
                <p>Commnad : `sudo apt-get update`</p>
                <p>Commnad : `sudo apt-get upgrade`</p>
                
                <p>2. Ubuntu에 대한 버전 확인은 `lsb_release -a` 로 확인 할 수 있습니다.</p>
                <p>Command : `lsb_release -a`</p>
            </div>

        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install node.js</h2>
            </header>
            
            <div class="content">
                <p>1. node.js를 설치하려면 `g++`과 `curl`이 설치되어 있어야 합니다.</p>
                <p>Command : `sudo apt-get install g++ curl`</p>
                
                <p>2. <a href="http://www.nodejs.org/">node.js</a> 홈페이지를 방문하여 node.js 압축파일를 다운받습니다.</p>
                <p><a href="http://www.nodejs.org/download/">최신버전</a></p>
                <p><a href="http://nodejs.org/dist/v0.10.35/">v0.10.35</a></p>
                
                <p>3. Download 받은 폴더에서 해당 파일에 대한 압축을 풀어 놓습니다.</p>
                <p>Command : `tar -xvzf node-v0.10.35.tar.gz` </p>
                
                <p>4. node.js 압축을 푼 폴더에서 `configure`를 실행시켜줍니다.</p>
                <p>Command : `./configure` </p>
                
                <p>5. 해당 폴더에서 `make` 명령어를 실행시켜줍니다.</p>
                <p>Command : `make`</p>
                
                <p>6. 해당 폴더에서 `make install` 명령어를 실행시켜줍니다.</p>
                <p>Command : `make install`</p>
                
                <p>7. 설치가 완료되면 `npm -version`, `nnode --version` 으로 node.js가 설치되어 있음을 확인할 수 있습니다.</p>
                <p>Command : `node --version`</p>
                <p>Command : `npm -version`</p>
                
            </div>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install node-gyp</h2>
            </header>
            
            <div class="content">
                <p>1. node-gyp는 nodejs의 c++ module을 컴파일 시켜주는 도구 입니다. 해당 프로젝트는 c++ module를 구현하여 사용하기 때문에 해당 libarary를 설치해야 합니다.</p>
                
                <p>2. node-gyp를 전역으로 설치합니다.</p>
                <p>Command : `npm install -g node-gyp`</p>
            </div>
            
        </article>
        
        <article class="nornen_content_type01">
            
            <header>
                <h2>Install jpeg & png library</h2>
            </header>
            
            <div class="content">
                <p>1. 볼륨 랜더링을 통해 나온 Byte를 Image로 인코딩하기 위해서 해당 라이브러리를 사용하게 됩니다. 따라서 JPEG과 PNG 라이브러리를 설치해야합니다.</p>
                
                <p>2. Jpeg library를 설치합니다.</p>
                <p>Command : `sudo apt-get install libjpeg-dev`</p>
                
                <p>3. Png library를 설치합니다.</p>
                <p>Command : `sudo apt-get install libpng-dev`</p>
            </div>
            
        </article>

        <article class="nornen_content_type01">

            <header>
                <h2>Install CUDA 6.0</h2>
            </header>

            <div class="content">
                <p>1. <a href="https://developer.nvidia.com/cuda-zone">CUDA</a>홈페이지를 접속하여 CUDA를 설치합니다.</p>
                <p><a href="https://developer.nvidia.com/cuda-downloads">최신버전</a></p>
                <p><a href="https://developer.nvidia.com/cuda-toolkit-60">CUDA 6.0</a></p>
                
                <p>2. CUDA 다운로드시 해당 OS와 Bit수에 맞는 버전을 다운로드 받아야 합니다.</p>
                
                <p>3. 다운로드 받을 때에 RUN 파일을 다운로드 받습니다.</p>
                
                <p>4. CUDA 설치는 Graphic카드의 사용을 중지시킨뒤 사용을 해야합니다. 따라서 `Ctrl + Alt + F1` 우분투 커멘드 창으로 이동합니다.</p>
                
                <p>5. 그 이후 설치 되어 있는 서비스중 lightdm 을 중지시킵니다.</p>
                <p>Command : `sudo service lightdm stop`</p>
                
                <p>6. 만약 lightdm을 중지시키고 설치가 되지 않는다면 아래의 절차를 수행합니다.</p>
                <p>`sudo vim /etc/default/grub` - Text Editor를 사용하여 해당 정보를 수정합니다.</p>
                <p>`GRUB_CMDLINE_LINUX_DEFAULT = ...` - 해당 라인에 `nomodeset` 을 추가합니다. </p>
                <p>`sudo update-grub` - 저장을 한뒤 해당 명령어를 칩니다.</p>
                <p>또는 `sudo reboot -h now` 을 하여 재부팅을 합니다</p>
                
                <p>7. 이후 run 파일의 경우 실행할 수 있는 권한이 없는데 해당되는 권한을 부여합니다.</p>
                <p>Command : `chmod 755 cuda_6.0.37_linux_32.run`</p>
                
                <p>8. 해당파일을 실행 시킵니다.</p>
                <p>Command : `./cuda_6.0.37_linux_32.run`</p>
                
                <p>9. 설치가 정상적으로 수행되게 되면 완료합니다.</p>
                
            </div>

        </article>

        <article class="nornen_content_type01">

            <header>
                <h2>Install nornenjs</h2>
            </header>

            <div class="content">
                <p>1. Nornenjs 프로젝트를 npm을 통하여 설치합니다.</p>
                <p>command : `npm install nornenjs`</p>
                
                <p>2. Example 소스가 `nornenjs/example` 폴더에 존재함으로 해당 폴더로 이동합니다.</p>
                <p>Command : `cd ./nornenjs/example`</p>
                
                <p>3. 해당 폴더에 www 파일을 실행시킵니다.</p>
                <p>Command : `node www`</p>
                
                <p>4. 브라우저를 통하여 접속해서 확인하면 아래와 같은 화면이 뜨게됩니다.</p>
                <p>`http://localhost:5000`</p>
            </div>

        </article>
        
    </section>
        
</section>

<%@ include file="../layout/foot.jspf" %>