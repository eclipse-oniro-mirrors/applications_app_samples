# 2D Engine API Sample

### Introduction

This sample tests the APIs provided by the 2D graphics engine, covering [@ohos.graphics.drawing](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkgraphics2d/js-apis-graphics-drawing.md) and [@kit.ArkGraphics2D](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkgraphics2d/js-apis-effectKit.md). Each API is exercised, and the rendered image is displayed in the [Text](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-text.md) component. Tapping "...expand" shows the comment area in expanded state, and tapping "...collapse" shows it in collapsed state.

### Usage

1. Start the application and tap "...expand" to expand the text, or tap "...collapse" to collapse it.

### Preview

| Collapsed                         | Expanded                          |
|-------------------------------------|------------------------------------------|
| ![](./screenshots/collapse.png) | ![](./screenshots/expand.png) |

### Project Directory

```
entry/src/main/
├── ets
│   ├── entryability
│   ├── entrybackupability
│   └── pages
│       └── TextCollapseEtsDemo.ets
└── resources
    ├── base
    │   ├── element
    │   ├── media
    │   └── profile
    ├── en_US
    │   └── element
    ├── rawfile
    │   ├── FZBWKSJW.TTF
    │   └── STXINGKA.ttf
    └── zh_CN
        └── element
```

### Implementation

* `getFoldIndex` (sets text styles and content according to the given view model list):
    * Defines a text style (`myTextStyle`) and a paragraph style (`myParagraphStyle`), and loads a custom font.
    * Creates a paragraph builder (`ParagraphGraphBuilder`) and adds text or placeholders according to the type and content of each element in the view model list.
    * Builds the paragraph and lays it out. If the paragraph has more than two lines, the folding point is calculated for the given width.
    * Creates a canvas, draws the paragraph on it, and returns the folding index and the line count.
* `getResultFromNdk` (converts `originViewModelList` into `collapseViewModelList`):
    * Obtains the folding index and line count through `getFoldIndex`.
    * Returns directly when the line count is less than or equal to 2.
    * Trims the list when the line count is greater than 2, keeping or dropping items according to the folding index.
    * Trimming rule: if the item type is 0, its content length is accumulated to the current index; if the item type is 1, the index is increased by 1.

### Permissions

None.

### Dependencies

None.

### Constraints and Limitations

1. This sample can run only on standard-system devices and has been verified on an RK3568 board.
2. This sample supports API 26 SDK (26.0.0). The `compileSdkVersion`, `targetSdkVersion`, and `compatibleSdkVersion` are all 26.0.0.
3. DevEco Studio 26.0.0 Release or later is required to compile and run this sample.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Graphics/Graphics2d/ExpandText/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
