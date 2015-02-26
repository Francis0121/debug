<%--
    User: pi Date: 15. 2. 3 Time: 오후 2:52
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>
<section class="nornen_section_wrap section_top">
    
    <section class="nornen_section">

        <article class="nornen_content_type01">

            <header>
                <h2>Server Javascript API</h2>
            </header>

            <div class="api">

            </div>

        </article>
        
        <article class="nornen_content_type01">

            <header>
                <h2>Client Javascript API</h2>
            </header>
            
            <div class="api">
                
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