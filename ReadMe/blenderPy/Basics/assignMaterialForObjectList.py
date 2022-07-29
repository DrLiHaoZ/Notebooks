
try:
    import bpy

    #该函数将随机对物体赋予材质
    def assignMaterialForObjectList(objects:list,materials:list) -> list:

        pass
except:
    pass
import bpy


# new a cube
bpy.ops.mesh.primitive_cube_add(location=(0, 0, 0), scale=(1, 1, 1))
cube = bpy.context.object

#new a material and enable use_nodes
bpy.data.materials.new(name = "mat")
mat = bpy.data.materials["mat"]
mat.use_nodes = True

# you can use one of two method to assign the material to the object
# choice 1 
cube.data.materials.append(mat)
# choice 2
cube.active_material = mat

# modify the material
mat.node_tree.nodes["Principled BSDF"].inputs[0].default_value = (0.8, 0.0729708, 0.152912, 1)


def assignMaterial(objList,material):
    try:
        for obj in objList:
            bpy.data.objects[obj].active_material = bpy.data.materials[material]
    except:
        pass
