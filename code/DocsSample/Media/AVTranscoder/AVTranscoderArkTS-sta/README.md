# AVTranscoderArkTS-sta

## 介绍

本示例为媒体->Media Kit(媒体服务)->[使用AVTranscoder实现视频转码(ArkTS)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/media/using-avtranscoder-for-transcodering.md)的静态接口配套示例工程。 

本示例以“开始转码-暂停转码-恢复转码-转码完成”的一次流程为示例，使用createAVTranscoder及其相关静态接口，展示AVTranscoder视频转码相关功能。

## 效果预览

| 预览                                      | 
| -------------------------------------------- | 
<img src="./screenshots/AVTranscoderArkTS-sta.png" width="300" />

## 使用说明
1. 安装编译生成的hap包，并打开应用；
2. 点击启动转码按钮，当日志打印“AVTranscoder progressUpdate = 100”时完成转码，可从设置的沙箱路径导出生成的转码视频；

## 工程目录

```
AVTranscoderArkTS
entry/src/main/ets/
└── pages
│    └── Index.ets (转码界面)
│
└── transcoder
    └── AVTranscoderManager.ets (转码功能)

entry/src/main/resources/
├── base
│   ├── element
│   │   ├── color.json
│   │   ├── float.json
│   │   └── string.json
│   └── media
│
└── rawfile
    └── H264_AAC.mp4 (视频资源)
entry/src/ohosTest/ets/
└── test
    ├── Ability.test.ets (UI测试代码)
    └── List.test.ets (测试套件列表)
```

## 相关权限

不涉及

## 依赖

不涉及

## 约束和限制

1. 本示例支持标准系统上运行，支持设备：RK3568;

2. 本示例支持API26版本SDK;


## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Media/AVTranscoder/AVTranscoderArkTS-sta/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```