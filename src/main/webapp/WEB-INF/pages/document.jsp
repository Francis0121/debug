<%--
    User: pi Date: 15. 2. 3 Time: 오후 2:52
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>
<section class="nornen_section_wrap section_top">
    
    <section class="nornen_section">

        <article class="nornen_content_type01">

            <header>
                <h2>Server Javascript API <a class="download" href="https://github.com/Francis0121/nornenjs/blob/master/lib/server.js">[Link]</a></h2>
            </header>

            <div class="api">
                <div class="head">
                    <p>- Constructor : 생성자</p>
                </div>
                
                <div class="func">
                    <p><span class="return">new</span> <span class="struct">NornenjsServer</span>(server, port, chunkSize)</p>
                </div>
                
                <div class="explain">
                    <p>- server : http 페이지 서버</p>
                    <p>- port : Byte streaming 을 하는 서버 Port [ default : 9000 ]</p>
                    <p>- chunkSize : Byte streaming 시 단위 사이즈</p>
                </div>
                
                <div class="head">
                    <p>- Function : 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">connect</span>( )</p>
                </div>
                
                <div class="explain">
                    <p>- socket.io 와 Byte Streaming 에 대해서 서버측 시작하는 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">socketIoEvent</span>( )</p>
                </div>
                
                <div class="explain">
                    <p>- socket.io 이벤트 연결 함수</p>
                    <p>- ` join ` 클라이언트 연결에 대한 응답</p>
                    <p>- ` disconnect ` 클라이언트 종료에 대한 응답</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">streamEvent</span>( )</p>
                </div>
                <div class="explain">
                    <p>- Byte Streaming 이벤트 연결 함수</p>
                </div>
                
            </div>

        </article>
        
        <article class="nornen_content_type01">

            <header>
                <h2>Client Javascript API <a class="download" href="https://github.com/Francis0121/nornenjs.debug/blob/master/src/main/webapp/client/nornenjs.0.1.0.js">[Link]</a></h2>
            </header>
            
            <div class="api">
                
                <div class="head">
                    <p>- Constructor : 생성자</p>
                </div>
                
                <div class="func">
                    <p><span class="return">new</span> <span class="struct">Nornenjs</span>(volumePrimaryNumber, host, socketIoPort, streamPort, selector)</p>
                </div>
                
                <div class="explain">
                    <p>- volumePrimaryNumber : 서버측 볼륨 고유번호</p>
                    <p>- host : 서버 호스트 URL</p>
                    <p>- socketIoPort : 서버 SocketIo 포트 정보</p>
                    <p>- streamPort : 스트리밍 서버 포트 정보</p>
                    <p>- selector : canvas에 대한 id 값</p>
                </div>

                <div class="head">
                    <p>- Function : 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">connect</span>(debugCallback, fpsCallback)</p>
                </div>
                
                <div class="explain">
                    <p>- debugCallback : 서버측에서 쿠다 시간 호출 콜백</p>
                    <p>- fpsCallback : FPS 출력에 대한 콜백</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">fpsInterval</span>($this, callback)</p>
                </div>
                
                <div class="explain">
                    <p>- $this : interval 실행시 상위 부모 객체</p>
                    <p>- callback : FPS 인터벌 수행시 호출하는 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">loading</span>()</p>
                </div>
                
                <div class="explain">
                    <p>- 로딩을 실행하는 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">socketIo</span>(debugCallback)</p>
                </div>
                
                <div class="explain">
                    <p>- Socket.Io 이벤트 등록 함수</p>
                    <p>- debugCallback :  debug 이벤트에 대한 콜백</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">streamOn</span>()</p>
                </div>
                
                <div class="explain">
                    <p>- 스트리밍에 대한 데이터가 오는 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">send</span>()</p>
                </div>
                
                <div class="explain">
                    <p>- 데이터를 보내기 위해 Byte Array를 만드는 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">finish</span>($this)</p>
                </div>
                
                <div class="explain">
                    <p>- 스트리밍 종료를 알리는 함수</p>
                    <p>- $this : 상위 부모 객체</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">addEvent</span>()</p>
                </div>
                
                <div class="explain">
                    <p>- 이벤트 등록 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">touchEvent</span>()</p>
                </div>
                
                <div class="explain">
                    <p>- 터치 이벤트 등록 함수</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">mouseEvent</span>()</p>
                </div>

                <div class="explain">
                    <p>- 마우스 이벤트 등록 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">resize</span>()</p>
                </div>

                <div class="explain">
                    <p>- 브라우저 리사이즈에 대한 이벤트 등록 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">type</span>(renderingType)</p>
                </div>

                <div class="explain">
                    <p>- 렌더링 타입 변환에 대한 함수</p>
                    <p>- renderingType : [ VOLUME : 1, MIP : 2, MPR : 3 ]</p>
                </div>

                <div class="func">
                    <p><span class="struct">axisType</span>(type)</p>
                </div>

                <div class="explain">
                    <p>- MPR 영상에 대해서 X, Y, Z 선택 함수</p>
                    <p>- type : [ X : 1, Y : 2, Z : 3 ]</p>
                </div>

                <div class="func">
                    <p><span class="struct">axis</span>(value, isFinish)</p>
                </div>

                <div class="explain">
                    <p>- Axis 이벤트 전송합수</p>
                    <p>- value :  Axis 위치에 대한 값</p>
                    <p>- isFinish : 이벤트 끝나는 여부에 따른 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">scale</span>(value, isFinish)</p>
                </div>

                <div class="explain">
                    <p>- 확대 축소 이벤트 전송함수</p>
                    <p>- value : 확대 축소 비율 값</p>
                    <p>- isFinish : 이벤트 끝나는 여부에 따른 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">brightness</span>(value, isFinish)</p>
                </div>

                <div class="explain">
                    <p>- 밝기 이벤트 전송함수</p>
                    <p>- value : 밝기 비율 값</p>
                    <p>- isFinish : 이벤트 끝나는 여부에 따른 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">otf</span>(value, isFinish)</p>
                </div>

                <div class="explain">
                    <p>- 밀도값 이벤트 전송함수</p>
                    <p>- value : 밀도 값</p>
                    <p>- isFinish : 이벤트 끝나는 여부에 따른 함수</p>
                </div>

                <div class="func">
                    <p><span class="struct">quality</span>(value, isFinish)</p>
                </div>

                <div class="explain">
                    <p>- 화질 선택 함수</p>
                    <p>- value : [ High : 1 , Low : 2 ] </p>
                    <p>- isFinish : 이벤트 끝나는 여부에 따른 함수</p>
                </div>
                
            </div>
            
        </article>
        
        <article class="nornen_content_type01">

            <header>
                <h2>CUDA API</h2>
            </header>

            <div class="api">

                <div class="head">
                    <p>- Struct : 구조체</p>
                </div>
                
                <div class="func">
                    <p><span class="struct">struct</span> Ray</p>
                    <p>{</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="var">float3</span> o;</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="var">float3</span> d;</p>
                    <p>};</p>
                </div>
                
                <div class="explain">
                    <p>- o : 광선의 원점벡터</p>
                    <p>- d : 광선의 방향벡터</p>
                </div>

                <div class="head">
                    <p>- Function : 함수</p>
                </div>
                
                <div class="func">
                    <p>__device__ <span class="return">uint</span> rgbaFloatToInt( <span class="var">float4</span> rgba )</p>
                </div>
                <div class="explain">
                    <p>- float4변수를 32bit unsigned char로 변환(device 함수)</p>
                </div>
                
                <div class="func">
                    <p>__device__ <span class="return">float4</span> mul(</p>
                    <p class="indent">const <span class="var">float</span> *M,</p>
                    <p class="indent">const <span class="var">float4</span> &v )</p>
                </div>
                <div class="explain">
                    <p>- float4변수와 시점 좌표 행렬과의 행렬곱 연산(device 함수)</p>
                </div>

                <div class="func">
                    <p>__device__ <span class="return">float3</span> mul(</p>
                    <p class="indent">const <span class="var">float</span> *M,</p>
                    <p class="indent">const <span class="var">float3</span> &v )</p>
                </div>
                <div class="explain">
                    <p>- float3변수와 시점 좌표 행렬과의 행렬곱 연산(device 함수)</p>
                </div>

                <div class="func">
                    <p>__device__ <span class="return">int</span> intersectBox(</p>
                    <p class="indent"><span class="var">Ray</span> r,</p> 
                    <p class="indent"><span class="var">float3</span> boxmin,</p> 
                    <p class="indent"><span class="var">float3</span> boxmax,</p> 
                    <p class="indent"><span class="var">float</span> *tnear,</p> 
                    <p class="indent"><span class="var">float</span> *tfar)</p>
                </div>
                <div class="explain">
                    <p>- 각각의 광선의 시작점과 끝점에 대한 연산(device 함수)</p>
                </div>

                <div class="func">
                    <p>__global__ <span class="return">void</span> render_kernel_volume(</p>
                    <p class="indent"><span class="var">uint</span> *d_output,</p>
                    <p class="indent"><span class="var">float</span> *d_invViewMatrix,</p>
                    <p class="indent"><span class="var">unsigned int</span> imageW,</p>
                    <p class="indent"><span class="var">unsigned int</span> imageH,</p>
                    <p class="indent"><span class="var">float</span> density,</p>
                    <p class="indent"><span class="var">float</span> brightness,</p>
                    <p class="indent"><span class="var">float</span> transferOffset,</p>
                    <p class="indent"><span class="var">float</span> transferScaleX,</p>
                    <p class="indent"><span class="var">float</span> transferScaleY,</p>
                    <p class="indent"><span class="var">float</span> transferScaleZ,</p>
                    <p class="indent"><span class="var">unsigned int</span> quality)</p>
                </div>
                <div class="explain">
                    <p>- 볼륨 가시화 알고리즘(ray casting)커널 함수.</p>
                </div>
    
                <div class="func">
                    <p>__global__ <span class="return">void</span> render_kernel_MIP(</p>
                    <p class="indent"><span class="var">uint</span> *d_output,</p>
                    <p class="indent"><span class="var">float</span> *d_invViewMatrix,</p>
                    <p class="indent"><span class="var">unsigned int</span> imageW,</p>
                    <p class="indent"><span class="var">unsigned int</span> imageH,</p>
                    <p class="indent"><span class="var">float</span> density,</p>
                    <p class="indent"><span class="var">float</span> brightness,</p>
                    <p class="indent"><span class="var">float</span> transferOffset,</p>
                    <p class="indent"><span class="var">float</span> transferScaleX,</p>
                    <p class="indent"><span class="var">float</span> transferScaleY,</p>
                    <p class="indent"><span class="var">float</span> transferScaleZ,</p>
                    <p class="indent"><span class="var">unsigned int</span> quality)</p>
                </div>
                <div class="explain">
                    <p>- 볼륨 가시화 알고리즘(MIP)커널 함수.</p>
                </div>

                <div class="func">
                    <p>__global__ <span class="return">void</span> render_kernel_MPR (</p>
                    <p class="indent"><span class="var">uint</span> *d_output,</p>
                    <p class="indent"><span class="var">float</span> *d_invViewMatrix,</p>
                    <p class="indent"><span class="var">unsigned int</span> imageW.</p>
                    <p class="indent"><span class="var">unsigned int</span> imageH,</p>
                    <p class="indent"><span class="var">float</span> density,</p>
                    <p class="indent"><span class="var">float</span> brightness,</p>
                    <p class="indent"><span class="var">float</span> transferOffset,</p>
                    <p class="indent"><span class="var">float</span> transferScaleX,</p>
                    <p class="indent"><span class="var">float</span> transferScaleY,</p>
                    <p class="indent"><span class="var">float</span> transferScaleZ,</p>
                    <p class="indent"><span class="var">unsigned int</span> quality)</p>
                </div>
                <div class="explain">
                    <p>- 볼륨 가시화 알고리즘(MPR)커널 함수.</p>
                </div>

                <div class="func">
                    <p><span class="return">void</span> volumeTextureLoad(</p>
                    <p class="indent"><span class="var">unsigned int</span> width,</p>
                    <p class="indent"><span class="var">unsigned int</span> height,</p>
                    <p class="indent"><span class="var">unsigned int</span> depth,</p>
                    <p class="indent"><span class="var">char</span> *filename,</p>
                    <p class="indent"><span class="var">Module</span> *pmodule)</p>
                </div>
                <div class="explain">
                    <p>- 볼륨 데이터 텍스쳐 메모리 바인딩 함수</p>
                </div>

                <div class="func">
                    <p><span class="return">void</span> otfTableTextureLoad(</p>
                    <p class="indent"><span class="var">float4</span> *input_float_1D,</p>
                    <p class="indent"><span class="var">unsigned int</span> otf_size,</p>
                    <p class="indent"><span class="var">Module</span> *pmodule);</p>
                </div>
                <div class="explain">
                    <p>- TF 테이블 텍스쳐 메모리 바인딩 함수</p>
                </div>

                <div class="func">
                    <p><span class="return">float4</span> *getOTFtable(</p>
                    <p class="indent"><span class="var">int</span> otf_start,</p>
                    <p class="indent"><span class="var">int</span> otf_end,</p>
                    <p class="indent"><span class="var">int</span> otf_size)</p>
                </div>
                <div class="explain">
                    <p>- TF 테이블 생성 함수</p>
                </div>

                <div class="func">
                    <p><span class="return">Handle&lt;Value&gt;</span> LanchKernel(const <span class="var">Arguments&ammp;</span> args)</p>
                </div>
                <div class="explain">
                    <p>- 커널 함수 실행</p>
                </div>
                
            </div>

            <br/>
            <br/>
            <br/>
            
        </article>
        
    </section>
    
</section>

<%@ include file="../layout/foot.jspf" %>