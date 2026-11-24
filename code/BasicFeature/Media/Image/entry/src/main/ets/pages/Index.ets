/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { logger, readImage } from '@ohos/photomodify';
import router from '@ohos.router';
import GetPictures from '../pages/GetPictures';
import common from '@ohos.app.ability.common';
import image from '@ohos.multimedia.image';

const TAG: string = '[Sample_Index]';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State isShowComment：组件内部状态
  @State isShowComment: boolean = true;

  // @State isShowCamera：组件内部状态
  @State isShowCamera: boolean = false;

  // @State isLand：组件内部状态
  @State isLand: boolean = false;

  // @State pixelMaps：组件内部状态
  @State pixelMaps: Array<PixelMap|undefined> = [];

  // @State commodityPixelMap：组件内部状态
  @State commodityPixelMap: PixelMap | null = null;

  // @State imageArr：组件内部状态
  @State imageArr: Array<PixelMap | null> = [];

  // @StorageLink imageList：与 AppStorage 双向绑定
  @StorageLink('imageList') @Watch('imageListChange') imageList: Array<string> = [];

  // @StorageLink fileSrc：与 AppStorage 双向绑定
  @StorageLink('fileFd') fileSrc: string = '';

  // @StorageLink isUpdate：与 AppStorage 双向绑定
  @StorageLink('isUpdate') isUpdate: boolean = false;
  private GetPictures: GetPictures = new GetPictures();
  scroller: Scroller = new Scroller();

  /**
   * terminateSelf：执行 terminateSelf 相关逻辑。
   */
  terminateSelf(context: common.UIAbilityContext): void {
    context.terminateSelf();
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    logger.info(TAG, 'enter aboutToAppear');
    if (AppStorage.get<string[]>('pixelMaps')) {
      this.pixelMaps.push(undefined);
    }
    let rawFile = getContext().resourceManager.getRawFdSync("commodity.png");
    let imageSourceApi = image.createImageSource(rawFile);
    imageSourceApi.createPixelMap().then((pixelMap) => {
      this.commodityPixelMap = pixelMap;
    });
    this.imageListChange();
  }

  /**
   * imageListChange：执行 imageListChange 相关逻辑。
   */
  async imageListChange(): Promise<void> {
    this.imageArr = await Promise.all(this.imageList.map(imgUrl =>{
      return readImage(imgUrl)
    }))

    logger.info(`arr-${this.imageArr.length}`)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度、内边距、外边距
      // Row：水平布局容器
      // 关键属性：宽度、高度、内边距、外边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、objectFit、点击事件回调
        // 交互：可点击交互
        // Image：图片
        // 关键属性：宽度、高度、objectFit、点击事件回调
        // 交互：可点击交互
        Image($r('app.media.back')).id('index_image_3')
          .width($r('app.float.size_46'))
          .height($r('app.float.size_26'))
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            let context: Context = getContext(this);
            this.terminateSelf(context as common.UIAbilityContext);
          })

        // Text：文本
        // 关键属性：字号、外边距、文本对齐
        // Text：文本
        // 关键属性：字号、外边距、文本对齐
        Text($r('app.string.publish_comments')).id('index_text_4')
          .fontSize($r('app.float.size_22'))
          .margin({ left: $r('app.float.size_10') })
          .textAlign(TextAlign.Center)

        // Button：按钮
        // 关键属性：字号、外边距、点击事件回调、pushUrl
        // 交互：可点击交互
        // Button：按钮
        // 关键属性：字号、外边距、点击事件回调、pushUrl
        // 交互：可点击交互
        Button($r('app.string.picture_operate'))
          .fontSize($r('app.float.size_22'))
          .margin({ left: $r('app.float.size_10') })
          .id('picture_operate')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/PicturePages'
            })
          })

        // Blank：占位空白
        Blank().id('index_blank_5')

        // Button：按钮
        // 关键属性：字号、高度、宽度、背景色、圆角、外边距
        // Button：按钮
        // 关键属性：字号、高度、宽度、背景色、圆角、外边距
        Button($r('app.string.submit')).id('index_button_6')
          .fontSize($r('app.float.size_20'))
          .height($r('app.float.size_32'))
          .width($r('app.float.size_80'))
          .backgroundColor($r('app.color.index_commit'))
          .borderRadius($r('app.float.size_20'))
          .margin({ right: $r('app.float.size_10') })
      }.id('index_row_2')
      .width('100%')
      .height($r('app.float.size_32'))
      .padding({ left: $r('app.float.size_14') })
      .margin({ top: $r('app.float.size_20') })

      // Scroll：滚动容器
      // 关键属性：外边距、尺寸约束、背景色
      // Scroll：滚动容器
      // 关键属性：外边距、尺寸约束、背景色
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        Column() {
          // Stack：层叠布局容器
          // 关键属性：背景色、高度、宽度、外边距
          // Stack：层叠布局容器
          // 关键属性：背景色、高度、宽度、外边距
          Stack({ alignContent: Alignment.Top }) {
            // Column：垂直布局容器
            // 关键属性：宽度、高度、外边距、圆角、背景色
            // Column：垂直布局容器
            // 关键属性：宽度、高度、外边距、圆角、背景色
            Column() {
              // Stack：层叠布局容器
              // 关键属性：内容对齐、外边距
              // Stack：层叠布局容器
              // 关键属性：内容对齐、外边距
              Stack() {
                // TextArea：多行输入框
                // 关键属性：高度、背景色、内容变更回调
                // 交互：输入/提交回调
                // TextArea：多行输入框
                // 关键属性：高度、背景色、内容变更回调
                // 交互：输入/提交回调
                TextArea({ placeholder: $r('app.string.tip') }).id('index_text_area_12')
                  .height($r('app.float.size_150'))
                  .backgroundColor(Color.White)
                  .onChange((value) => {
                    if (value.length === 0) {
                      this.isShowComment = true;
                    } else {
                      this.isShowComment = false;
                    }
                  })

                if (this.isShowComment) {
                  // Image：图片
                  // 关键属性：高度、宽度、外边距
                  // Image：图片
                  // 关键属性：高度、宽度、外边距
                  Image($r('app.media.comment')).id('index_image_13')
                    .height($r('app.float.size_20'))
                    .width($r('app.float.size_20'))
                    .margin({ top: $r('app.float.size_8'), left: $r('app.float.size_16') })
                }
              }.id('index_stack_11')
              .alignContent(Alignment.TopStart)
              .margin({ top: $r('app.float.size_40') })

              if (this.imageList.length > 0) {
                // Grid：网格容器
                // 关键属性：columnsTemplate、列间距、行间距、外边距、宽度、高度
                // Grid：网格容器
                // 关键属性：columnsTemplate、列间距、行间距、外边距、宽度、高度
                Grid() {
                  ForEach(this.imageList, (imgUrl: string, index: number) => {
                    // GridItem：网格项
                    GridItem() {
                      if (index < this.imageList.length) {
                        // Image：图片
                        // 关键属性：点击事件回调
                        // 交互：可点击交互
                        // Image：图片
                        // 关键属性：点击事件回调
                        // 交互：可点击交互
                        Image(this.imageArr ? this.imageArr[index] : imgUrl)
                          .onClick(() => {
                            AppStorage.setOrCreate<number>('selectIndex', index);
                            this.isLand = true;
                            router.pushUrl({
                              url: 'pages/UpdatePages',
                              params: { mediaUri: imgUrl }
                            })
                          })
                          .id('Photo')
                          .width('100%')
                          .height($r('app.float.size_100'))
                          .borderRadius($r('app.float.size_10'))
                          .backgroundColor(Color.Blue)
                      }
                    }.id('index_grid_item_15')
                  })
                }.id('index_grid_14')
                .columnsTemplate('1fr 1fr 1fr 1fr')
                .columnsGap($r('app.float.size_8'))
                .rowsGap($r('app.float.size_8'))
                .margin({ top: $r('app.float.size_8') })
                .width('94%')
                .height(105 * (this.pixelMaps.length > 4 ? 2 : 1))
              } else {
                // Column：垂直布局容器
                // 关键属性：点击事件回调、getImage
                // 交互：可点击交互
                // Column：垂直布局容器
                // 关键属性：点击事件回调、getImage
                // 交互：可点击交互
                Column() {
                  // Image：图片
                  // 关键属性：宽度、高度
                  // Image：图片
                  // 关键属性：宽度、高度
                  Image($r('app.media.camera')).id('index_image_16')
                    .width($r('app.float.size_40'))
                    .height($r('app.float.size_40'))

                  // Text：文本
                  // 关键属性：字号
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.add_picture')).id('index_text_17')
                    .fontSize($r('app.float.size_16'))
                }
                .id('add')
                .onClick(() => {
                  this.GetPictures.getImage()
                })
                .width('94%')
                .height($r('app.float.size_130'))
                .margin({ top: $r('app.float.size_10') })
                .borderRadius($r('app.float.size_10'))
                .justifyContent(FlexAlign.Center)
                .backgroundColor('#F1F3F5')
              }
              // Text：文本
              // 关键属性：字号、字体颜色、自身对齐、外边距
              // Text：文本
              // 关键属性：字号、字体颜色、自身对齐、外边距
              Text($r('app.string.anonymous_display')).id('index_text_18')
                .fontSize($r('app.float.size_15'))
                .fontColor('#99182431')
                .alignSelf(ItemAlign.Start)
                .margin({ left: $r('app.float.size_16'), top: $r('app.float.size_16') })
            }.id('index_column_10')
            .width('100%')
            .height('100%')
            .margin({ top: $r('app.float.size_22') })
            .borderRadius($r('app.float.size_20'))
            .backgroundColor('#fffffff')

            // Image：图片
            // 关键属性：宽度、高度
            // Image：图片
            // 关键属性：宽度、高度
            Image(this.commodityPixelMap).id('index_image_19')
              .width($r('app.float.size_44'))
              .height($r('app.float.size_44'))
          }.id('index_stack_9')
          .backgroundColor($r('app.color.index_stack'))
          .height('100%')
          .width('94%')
          .margin({ top: $r('app.float.size_10') })
        }.id('index_column_8')
        .width('100%')
        .height($r('app.float.size_380'))
      }.id('index_scroll_7')
      .margin({ top: $r('app.float.size_20') })
      .constraintSize({ maxHeight: '94%', minHeight: '94%' })
      .backgroundColor($r('app.color.index_stack'))
    }.id('index_column_1')
    .width('100%')
    .height('100%')
  }
}