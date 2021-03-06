# my-vim

## how to install my-vim config

```shell
cd ~
git clone git@github.com:newpanderking/my-vim.git .vim
ln -s .vim/vimrc .vimrc
```

done!

> 说明：vim配置是一个不断定制化的过程，先定制自一部分自己的配置，有一部分是从网上copy过来的。不断的打磨自己顺手的编辑器。

## 命令说明

- ` ` 空格是本配置的前置 leader 键位

### 自定义命令

- `Ctrl+s`: 保存文件
- `<spec>sa` : 全选选
- `<spec>q` : 快速退出

### F1~F5 说明

- F1: 内置功能键，帮助文档；
- F2: 行号是否显示, 行号开关；  
- F4: 是否折叠行，折行开关；
- F5: 粘贴模式开关；
- F6: 语法高亮开关；
- F8: markdown 预览开关；

### TAB 命令

- `Ctrl+H` : 上一个tab;
- `Ctrl+L` : 下一个tab;
- `Ctrl+c` : 关闭tab;

### markdown 语法命令

- Ctr+p: normal模式下，markdown 预览，浏览器预览
- 以下命令均为markdown文件insert模式下的快捷键
  - `,,` 插入锚点`<++>`
  - `,f` 查找锚点
  - `,d` `行内代码`
  - `,b` **加粗**
  - `,s` ~~删除线~~
  - `,c` 代码块
  - `,h` ==标题==  
  - `,1` 一级标题
  - `,2` 二级标题
  - `,3` 三级标题
  - `,4` 四级标题
  - `,5` 五级标题
  - `,p` 图片
  - `,a` 超链接
  - `,l` 横线

### Git 命令

- `]h` : normal模式下，当前页面上一个变更点；
- `[h` : normal模式下，当前页面下一个变更点；

### NerdTree 使用
| 命令 | 作用                     |
| ---  | ---                      |
| tt   | 打开/关闭 菜单栏         |
| o    | 打开关闭节点             |
| O    | 递归打开所有子节点节点   |
| t    | 在一个新的tab打开        |
| x    | 关闭父级节点             |
| X    | 关闭当前节点所有的子节点 |
