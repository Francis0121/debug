<%--
    User: pi Date: 15. 1. 10 Time: 오후 3:36
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<section class="nornen_section_wrap">
    
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

<section class="nornen_section_wrap">

    <section class="nornen_section">
        
        <article class="nornen_content_type03">
            
            <header>
                <h2>
                    Why Nornenjs?
                </h2>
            </header>
            
            
            <ul>
                
                <li>

                    
                </li>
                
                <li>
                    
                </li>
                
                <li>
                    
                </li>
                
            </ul>
            
        </article>
        
    </section>
    
</section>

<%@ include file="../layout/foot.jspf" %>