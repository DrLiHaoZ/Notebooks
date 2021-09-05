import bpy
import random


bpy.data.materials["Material.001"].node_tree.nodes["Principled BSDF"].inputs[4].default_value = 0.823529 
bpy.data.materials["Material.001"].node_tree.nodes["Principled BSDF"].inputs[0].default_value = (0.145389, 0.212914, 0.8, 1)


spacing = 2.2
for x in range(10):
    for y in range(10):
        location = (x * spacing,y * spacing, random.random()* 2)
        bpy.ops.mesh.primitive_cube_add(location = location)
    
        item = bpy.context.object
        if random.random() < 0.5:
            item.data.materials.append(bpy.data.materials["Material.001"])
        else:
            item.data.materials.append(bpy.data.materials["Material"])


            # 注意这里需要自己建立材质