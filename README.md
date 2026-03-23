# Learning to fly simulator

这是一个从“Learning to Fly in Seconds”项目中独立出来的仿真器单独测试代码


## 开始

clone此repo的代码

```bash
git clone https://github.com/gordon-13/l2f_simulator.git
cd l2f_simulator
git submodule update --init --recursive
```

运行`test.sh`脚本，编译角速度控制回路的代码

```bash
./test.sh
```

使用tensorboard查看集成测试的运行过程

```bash
tensorboard --logdir build/test/logs/
```
