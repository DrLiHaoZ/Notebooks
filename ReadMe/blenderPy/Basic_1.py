import bpy
import math

# create a cube 
bpy.ops.mesh.primitive_cube_add()
so = bpy.context.active_object


#move object 
so.location[0] = 5

# rotate object 
so.rotation_euler[0] += math.radians(45)

#add modifier
mod_subsurf = so.modifiers.new("myModifier",'SUBSURF')

# you can call the object by class
'''
bpy.data.objects["Cube"].modifiers["myModifier"].levels = 3
'''
# you can call the object by name

'''
bpy.context.object.modifiers["myModifier"].levels = 3
'''
mod_subsurf.levels = 3


# smooth or flat the object
bpy.ops.object.shade_flat()
bpy.ops.object.shade_smooth()

# create displacement modifier
mod_displace = so.modifiers.new("myDisplacement",'DISPLACE')

# https://docs.blender.org/api/current/bpy.types.Texture.html
new_texture = bpy.data.textures.new("myTexture",'DISTORTED_NOISE')

#assign the texture to displacement modifier
mod_displace.texture = new_texture