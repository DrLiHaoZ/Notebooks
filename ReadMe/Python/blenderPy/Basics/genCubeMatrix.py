
import numpy as np

try:
    import bpy
    def genCubeMatrix (locations): 
        num = len(locations)
        cubeMatrix = []
        for i in range(num):
            location = locations[i]
            bpy.ops.mesh.primitive_cube_add(enter_editmode=False, align='WORLD', location=location, scale=(1, 1, 1))
            cube = bpy.context.object
            cubeMatrix.append(cube)
        return cubeMatrix
except:
    pass


#生成矩阵的坐标，num为矩阵单边的点数，padding为间隔的距离
def genMarixLocaion (num:int,padding:float):
    raw = np.linspace(start= - (num / 2) * padding, stop= (num / 2) * padding, num = num)
    x = list(map(lambda x:round(x,1),raw))
    y = list(map(lambda x:round(x,1),raw))

    result = []
    xx,yy = np.meshgrid(x,y)
    for i in range(num):
        for j in range(num):
            result.append([xx[i][j],yy[i][j],0])
    return result


locations = genMarixLocaion(5,3)
cubeMatrix =  genCubeMatrix(locations)

