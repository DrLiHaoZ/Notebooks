import bpy

x_num = 3
y_num = 3
z_num = 3
padding = 2.2

# Get material
mat = bpy.data.materials.get("Material.001")


# for loop to create the cube matrix
for x in range(x_num):
    for y in range(y_num):
        for z in range(z_num):
            bpy.ops.mesh.primitive_cube_add(location=(x*padding, y*padding, z*padding))

# Assign the material to object
for obj in bpy.data.objects:
    obj.data.materials.append(mat)