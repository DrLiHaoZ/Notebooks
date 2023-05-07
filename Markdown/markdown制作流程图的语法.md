
- mermaid源网站 
- https://mermaid-js.github.io/mermaid/#/
```mermaid
graph TD 
A[方形] --> B(圆角) %%这里写的是注释
    B --> C{条件a}
    C --> |a=1| D[结果1]
    C --> |a=2| E[结果2]
    F[竖向流程图] --> f[DE]
```

- TD是上下方向
- LR是左右方向
- 括号前为该括号的id，可以随便取，但最好使用英文字母
