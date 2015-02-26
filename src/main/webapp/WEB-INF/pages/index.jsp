<%--
    User: pi Date: 15. 1. 10 Time: 오후 3:36
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<section class="nornen_section_wrap section_top">

    <section class="nornen_section">

        <article class="nornen_content_type01">

            <header>
                <h2>- 볼륨 가시화란?</h2>
            </header>

            <div class="content">
                <p>볼륨 가시화는 3차원으로 구성된 볼륨 데이터를 가시화 하는 방법으로, 물체를 미세한 정육면체나 미립자의 합으로 표현하는 기술이다.</p>

                <p>볼륨 가시화는 주로 의학적, 공학적 가시화에 사용되며 의학용으로는 임상 진단이나 수술 모의실험 등에 사용할 수 있다.</p>

                <p>볼륨 데이터는 일반적으로 복셀(voxel)이라고 부르는 스칼라(scalar)값의 3차원 배열 형태로 구성되어 있으며,</p>
                
                <p>볼륨 데이터의 크기는 매우 크기 때문에 연산 시간이 오래 걸리는 문제가 있다. 이러한 문제를 해결하기 위해 다중 프로세서를 이용한 가속화 방법들이 연구되고 있다.</p>

            </div>

            <header>
                <h2>- 구현</h2>
            </header>

            <div class="content">
                <p> 본 프로젝트는 클라이언트 서버 모델을 이용한 시스템이다.</p>

                <p>클라이언트 서버 모델이란 서버에서 다수의 클라이언트 요청에 대해 연산이나 서비스를 제공하는 방법이다. </p>

                <p>본 프로젝트의 서버는 서버 사이드 개발에 사용되는 소프트웨어 플랫폼인 Node.js로 구성되어 있다.</p>

                <p> 그리고 GPU 엔진의 경우 NVIDIA에서 병렬 컴퓨팅을 구현하는 기술인 CUDA를 이용하여 구성하였다.</p>
            </div>

            <header>
                <h2>- 추후 방향</h2>
            </header>
            
            <div class="content">
                <p>
                    1. Binaryjs 를 이용한 스티리밍 방식을 Custom 스트리밍으로 변경<br/>
                    &nbsp;&nbsp;&nbsp;- Custom Protocol 방식 정의
                </p>
                <p>
                    2. IOS, Android natvie Application 에서 동작 가능하도록 구현<br/>
                    &nbsp;&nbsp;&nbsp;- Multi touch 기능을 이용한 다양한 이벤트 구현
                </p>
                <p>
                    3. Nodejs 이외에 python, java 와 같은 다른 언어에서도 동작하도록 구현
                </p>
                <p>
                    4. CUDA를 이용하여 Wavelet transfrom을 통한 이미지 Encoding 시간 감소
                </p>
                <p>
                    5. CUDA Kernel 영역에서의 가속화
                </p>
                <p>
                    6. Window 서버 환경 구축
                </p>
            </div>
            
        </article>

    </section>
    
</section>

<section class="nornen_section_wrap background_skyblue">

    <section class="nornen_section">
        
        <article class="nornen_content_type03">
            
            <header>
                <h2>
                    Why Nornenjs?
                </h2>
                <div class="bar background_darkblue">

                </div>
            </header>
            
            
            <ul class="content">
                
                <li>
                    <img src="${cp}/resources/image/icon/cost.png">
                    <h3>가격의 감소</h3>
                    <p>본 프로젝트는 가상화된 서버환경에서 볼륨 렌더링 연산을 수행한다. 이를 통해 다수의 사용자들의 그래픽 하드웨어 구입 및 업그레이드 비용을 절약시킬 수 있다.</p>
                </li>
                
                <li>
                    <img src="${cp}/resources/image/icon/clock.png">
                    <h3>속도의 증가</h3>
                    <p>본 프로젝트는 가상회된 GPU 서버를 이용하여 병렬 연산을 수행하기 때문에 실시간 볼륨 가시화가 가능하다.</p>
                </li>
                
                <li>
                    <img src="${cp}/resources/image/icon/image.png">
                    <h3>이미지 퀄리티</h3>
                    <p>본 프로젝트는 모바일 및 테블릿 PC환경에서도 데스크탑과 동일한 화질의 영상을 제공 받는 것이 가능하다.</p>
                </li>
                
            </ul>
            
        </article>
        
    </section>
    
</section>

<section class="nornen_section_wrap">
    
    <section class="nornen_section">

        <article class="nornen_content_type03">

            <header>
                <h2>
                    Use Library
                </h2>
                <div class="bar background_skyblue">

                </div>
            </header>

            <ul class="list">
                
                <li>
                    <h3>NVIDIA CUDA</h3>
                    <a href="https://developer.nvidia.com/cuda-zone">https://developer.nvidia.com/cuda-zone</a>
                </li>
                
                <li>
                    <h3>Node.js</h3>
                    <a href="http://www.nodejs.org/">http://www.nodejs.org/</a>
                </li>
                
                <li>
                    <h3>Node-gyp</h3>
                    <a href="https://github.com/TooTallNate/node-gyp">https://github.com/TooTallNate/node-gyp</a>
                </li>
                
                <li>
                    <h3>BinaryJs</h3>
                    <a href="http://binaryjs.com/">http://binaryjs.com/</a>
                </li>
                
                <li>
                    <h3>Node Cuda</h3>
                    <a href="https://github.com/kashif/node-cuda">https://github.com/kashif/node-cuda</a>
                </li>

                <li>
                    <h3>Express Framework</h3>
                    <a href="http://expressjs.com/">http://expressjs.com/</a>
                </li>

                <li>
                    <h3>Jpeg, Png Compress</h3>
                    <a href="https://www.npmjs.com/package/jpeg">https://www.npmjs.com/package/jpeg</a>
                </li>
                
                <li>
                    <h3>Socket.io</h3>
                    <a href="http://socket.io/">http://socket.io/</a>
                </li>

                <li>
                    <h3>Sqlite3</h3>
                    <a href="https://github.com/mapbox/node-sqlite3">https://github.com/mapbox/node-sqlite3</a>
                </li>

            </ul>
            
        </article>
        
    </section>
    
</section>

<%@ include file="../layout/foot.jspf" %>