<%--
    User: pi Date: 15. 1. 10 Time: 오후 3:36
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<section class="nornen_section_wrap section_top">

    <section class="nornen_section">

        <article class="nornen_content_type01">

            <header>
                <h2>-What is Volume Rendering?</h2>
            </header>

            <div class="content">
                <p>In scientific visualization and computer graphics, volume rendering is a set of techniques used to display a 2D projection of a 3D discretely sampled data set, typically a 3D scalar field.</p>

                <p>A typical 3D data set is a group of 2D slice images acquired by a CT, MRI, or MicroCT scanner. Usually these are acquired in a regular pattern (e.g., one slice every millimeter) and usually have a regular number of image pixels in a regular pattern. This is an example of a regular volumetric grid, with each volume element, or voxel represented by a single value that is obtained by sampling the immediate area surrounding the voxel.</p>

                <p>To render a 2D projection of the 3D data set, one first needs to define a camera in space relative to the volume. Also, one needs to define the opacity and color of every voxel. This is usually defined using an RGBA (for red, green, blue, alpha) transfer function that defines the RGBA value for every possible voxel value.</p>

                <p>For example, a volume may be viewed by extracting isosurfaces (surfaces of equal values) from the volume and rendering them as polygonal meshes or by rendering the volume directly as a block of data. The marching cubes algorithm is a common technique for extracting an isosurface from volume data. Direct volume rendering is a computationally intensive task that may be performed in several ways.</p>
            </div>

            <header>
                <h2>-Implementation</h2>
            </header>

            <div class="content">
                <p>In scientific visualization and computer graphics, volume rendering is a set of techniques used to display a 2D projection of a 3D discretely sampled data set, typically a 3D scalar field.</p>

                <p>A typical 3D data set is a group of 2D slice images acquired by a CT, MRI, or MicroCT scanner. Usually these are acquired in a regular pattern (e.g., one slice every millimeter) and usually have a regular number of image pixels in a regular pattern. This is an example of a regular volumetric grid, with each volume element, or voxel represented by a single value that is obtained by sampling the immediate area surrounding the voxel.</p>

                <p>To render a 2D projection of the 3D data set, one first needs to define a camera in space relative to the volume. Also, one needs to define the opacity and color of every voxel. This is usually defined using an RGBA (for red, green, blue, alpha) transfer function that defines the RGBA value for every possible voxel value.</p>

                <p>For example, a volume may be viewed by extracting isosurfaces (surfaces of equal values) from the volume and rendering them as polygonal meshes or by rendering the volume directly as a block of data. The marching cubes algorithm is a common technique for extracting an isosurface from volume data. Direct volume rendering is a computationally intensive task that may be performed in several ways.</p>
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
                    <h3>Cost Down</h3>
                    <p>Portable Network Graphics[2] (PNG[3]), is a raster graphics file format that supports lossless data compression. PNG was created as an improved, non-patented replacement for Graphics Interchange Format (GIF), and is the most used lossless image compression format on the Internet.</p>
                </li>
                
                <li>
                    <img src="${cp}/resources/image/icon/clock.png">
                    <h3>Time Reduce</h3>
                    <p>Portable Network Graphics[2] (PNG[3]), is a raster graphics file format that supports lossless data compression. PNG was created as an improved, non-patented replacement for Graphics Interchange Format (GIF), and is the most used lossless image compression format on the Internet.</p>
                </li>
                
                <li>
                    <img src="${cp}/resources/image/icon/image.png">
                    <h3>Quality Up</h3>
                    <p>Portable Network Graphics[2] (PNG[3]), is a raster graphics file format that supports lossless data compression. PNG was created as an improved, non-patented replacement for Graphics Interchange Format (GIF), and is the most used lossless image compression format on the Internet.</p>
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