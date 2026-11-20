/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/components/pages/PictureOptions.ets
 * 文件职责：PictureOptions 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PictureOptions。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import image from '@ohos.multimedia.image';
import { logger } from '../util/Logger';
import { copyPixelMap } from '../util/CopyObj';
import { pictureJsDatas, pictureNdkDatas } from '../model/AdjustModels';
import { CropTasks, TaskData, Tasks } from '../model/AdjustData';
import PixelMapQueue from '../feature/PixelMapQueue';
import { FontColorData, MaterialData } from '../model/MaterialData';
import { BusinessError } from '@ohos.base';
import { DecodingPicture, EncodingPicture } from '../util/PictureUtil';
import { NDKPictureDecoding, NDKPictureEncoding } from '../util/PictureUtil';

// const 语句
const TAG: string = '[Sample_Picture]';

/**
 * PictureOptions：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PictureOptions {
  // @State pixelMap：组件内部状态
  @State pixelMap: PixelMap | undefined | null = undefined;

  // @State isPixelMapChange：组件内部状态
  @State isPixelMapChange: boolean = false;

  // @State adjustMarkJudg：组件内部状态
  @State adjustMarkJudg: boolean = false;

  // @State currentTask：组件内部状态
  @State currentTask: number = Tasks.ADJUST;

  // @State currentCropTask：组件内部状态
  @State currentCropTask: number = CropTasks.NONE;

  // @State tempPixelMap：组件内部状态
  @State tempPixelMap: image.PixelMap | undefined | null = undefined;

  // @State cancelOkText：组件内部状态
  @State cancelOkText: Resource | null = null;

  // @State brightnessValue：组件内部状态
  @State brightnessValue: number = 0;

  // @State outSetValueOne：组件内部状态
  @State outSetValueOne: number = 0;

  // @State originBM：组件内部状态
  @State originBM: PixelMap | null = null;

  // @State cropIndex：组件内部状态
  @State cropIndex: number = 0;

  // @State canClick：组件内部状态
  @State canClick: boolean = true;

  // @State loading：组件内部状态
  @State loading: boolean = false;

  // @State isCancelQuit：组件内部状态
  @State isCancelQuit: boolean = false;

  // 选择资源素材index
  // @State resourceIndex：组件内部状态
  @State resourceIndex: number = 0;

  // @State isTextMaterial：组件内部状态
  @State isTextMaterial: boolean = true;

  // 字段 selectedResource：声明并维护该成员的状态
  selectedResource: Resource | undefined = $r('app.color.material_font_color_one');

  // 字段 scroller：声明并维护该成员的状态
  scroller: Scroller = new Scroller();

  // 字段 brightnessOriginBM：声明并维护该成员的状态
  brightnessOriginBM: PixelMap | null | undefined = null;

  // @State resolution：组件内部状态
  @State resolution: string = '';

  // @State inputValue：组件内部状态
  @State inputValue: string = '';

  // 分辨率的坐标
  // @State dpiX：组件内部状态
  @State dpiX: number = 0;

  // @State dpiY：组件内部状态
  @State dpiY: number = 0;

  // 分辨率
  // @State dpi：组件内部状态
  @State dpi: string = '';

  // 图片父容器大小
  containerArea: Area | null = null;

  // 字段 isBrightChanging：声明并维护该成员的状态
  isBrightChanging: boolean = false;

  // fileName
  // @State jpegFileName：组件内部状态
  @State jpegFileName: string = 'HdrVivid.jpg';

  // @State heifFileName：组件内部状态
  @State heifFileName: string = 'HEIFISOMultiChannelBaseColor0512V12.heic';

  // @State packingFileName：组件内部状态
  @State packingFileName: string = '';

  // 字段 pixelMapQueue：声明并维护该成员的状态
  private pixelMapQueue: PixelMapQueue = new PixelMapQueue();

  // 字段 pushState1：声明并维护该成员的状态
  pushState1: number = 0; // source
  pushState2: number = 1; // obj
  outState1: number = 0; // buffer
  outState2: number = 1; // file
  pictureStatus1: number = 0; // jpeg
  pictureStatus2: number = 1; // heic
  auxiliaryType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;

  // @State showPicture：组件内部状态
  @State showPicture: string = '';

  /**
   * 刷新图层显示
   */
  flushPage(): void {
    // 更新 tempPixelMap
    this.tempPixelMap = this.pixelMap;
    // 更新 pixelMap
    this.pixelMap = null;
    // 更新 pixelMap
    this.pixelMap = this.tempPixelMap;
  }

  /**
   * onEditCancel：执行 onEditCancel 相关逻辑。
   */
  async onEditCancel(): Promise<void> {
    // if 语句
    if (this.currentTask === Tasks.DECODEJS || this.currentTask === Tasks.ENCODEJS) {
      // 更新 currentTask
      this.currentTask = Tasks.ADJUST;
      // 更新 cropIndex
      this.cropIndex = 0;
    }
    // if 语句
    if (this.currentTask === Tasks.DECODENDK || this.currentTask === Tasks.ENCODENDK) {
      // 更新 currentTask
      this.currentTask = Tasks.MARK;
      // 更新 cropIndex
      this.cropIndex = 0;
    }

    // 更新 isCancelQuit
    this.isCancelQuit = true;
    // 更新 outSetValueOne
    this.outSetValueOne = 0;
    // if 语句
    if (this.originBM !== null && this.originBM !== undefined) {
      // 更新 pixelMap
      this.pixelMap = await copyPixelMap(this.originBM); // 拷贝
    }
    // 移出一个缓存
    const pm: image.PixelMap | undefined = this.pixelMapQueue.pop();
    // 更新 releasePm
    this.releasePm(pm);
  }

  /**
   * 选择子菜单
   * @param item
   * @param hasInputText
   */
  async onSelectItem(item: TaskData): Promise<void> {
    // if 语句
    if (item.task !== undefined) {
      // 更新 currentTask
      this.currentTask = item.task;
    }
    // if 语句
    if (item.text !== undefined) {
      // 更新 cancelOkText
      this.cancelOkText = item.text
    }
    // 更新 originBM
    this.originBM = await copyPixelMap(this.pixelMap!) // 拷贝
    // 保存到队列
    this.pixelMapQueue.push(this.originBM);
  }

  /**
   * 多图图片解码
   * @param pictureStatus 图片类型(0:jpeg, 1:heif)
   * @param auxType 解码类型(1:Gain map)
   * @returns
   */
  async decodingPictureJs(pictureStatus: number, auxType: image.AuxiliaryPictureType): Promise<void> {
    logger.info(TAG, `decodingPicture start`);
    logger.debug(TAG, `decodingPicture Type = ${auxType}`);
    // if 语句
    if (!pictureStatus) { // jpeg
      this.pixelMap = await DecodingPicture(this.jpegFileName, auxType);
    } else {
      // 更新 pixelMap
      this.pixelMap = await DecodingPicture(this.heifFileName, auxType);
    }
    // if 语句
    if (!this.pixelMap) {
      logger.info(TAG, `decodingPicture no pixelMap`);
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
    // if 语句
    if (!imageInfo) {
      logger.info(TAG, `decodingPicture no imageInfo`);
      return;
    }
    logger.debug(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    logger.debug(TAG, `imageInfo.isHdr  = ${imageInfo.isHdr}`);
    // 更新 flushPage
    this.flushPage();
    logger.info(TAG, 'decodingPicture end');
  }

  /**
   * 多图图片编码
   * @param pushStatus 编码入参(0:source, 1:obj)
   * @param jpegFileName 图片类型(jpeg)
   * @param outStatus 编码出参(0:buffer, 1:file)
   * @returns
   */
  async encodingPictureJs(pushStatus: number, outStatus: number): Promise<void> {
    logger.info(TAG, 'encodingPicture start');
    // 更新 pixelMap
    this.pixelMap = await EncodingPicture(pushStatus, this.jpegFileName, outStatus);
    // if 语句
    if (!this.pixelMap) {
      logger.info(TAG, `encodingPicture no pixelMap`);
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
    // if 语句
    if (!imageInfo) {
      logger.info(TAG, `encodingPicture no imageInfo`);
      return;
    }
    logger.debug(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    logger.debug(TAG, `imageInfo.isHdr  = ${imageInfo.isHdr}`);
    // 更新 flushPage
    this.flushPage();
    logger.info(TAG, 'encodingPicture end');
  }

  /**
   * Native多图图片解码
   * @param decodingType 解码类型(1:Gain map)
   * @returns
   */
  async decodingPictureNdk(auxType: image.AuxiliaryPictureType, uri: string): Promise<void> {
    logger.info(TAG, `decodingPicture start`);
    logger.debug(TAG, `decodingPicture Type = ${auxType}`);
    // 更新 pixelMap
    this.pixelMap = await NDKPictureDecoding(uri, auxType);
    // if 语句
    if (!this.pixelMap) {
      logger.info(TAG, `decodingPicture no pixelMap`);
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
    // if 语句
    if (!imageInfo) {
      logger.info(TAG, `decodingImage no imageInfo`);
      return;
    }
    logger.debug(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    logger.debug(TAG, `imageInfo.isHdr  = ${imageInfo.isHdr}`);
    // 更新 flushPage
    this.flushPage();
    logger.info(TAG, 'decodingImage end');
  }

  /**
   * Native多图图片编码
   * @param encodingType 编码类型(0:AUTO,1:SDR)
   * @returns
   */
  async encodingPictureNdk(fileName: string, encodingObject: string, encodingResult: string): Promise<void> {
    logger.info(TAG, 'encodingPicture start');
    // 更新 pixelMap
    this.pixelMap = await NDKPictureEncoding(fileName, encodingObject, encodingResult);
    // if 语句
    if (!this.pixelMap) {
      logger.info(TAG, `decodingPicture no pixelMap`);
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
    // if 语句
    if (!imageInfo) {
      logger.info(TAG, `encodingPicture no imageInfo`);
      return;
    }
    logger.debug(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    logger.debug(TAG, `imageInfo.isHdr  = ${imageInfo.isHdr}`);
    // 更新 flushPage
    this.flushPage();
    logger.info(TAG, 'encodingPicture end');
  }

  /**
   * 底部一级菜单
   */
  /**
   * getFirstLvMenu：执行 getFirstLvMenu 相关逻辑。
   */
  @Builder
  getFirstLvMenu() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_adjust'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_picture_js'))
          .fontColor(Color.White)
          .fontSize($r('app.float.size_16'))
      }
      .id('external')
      .justifyContent(FlexAlign.Center)
      .justifyContent(FlexAlign.Center)
      .height('100%')
      .width('40%')
      .margin({ left: '10%' })
      .backgroundColor(this.adjustMarkJudg ? Color.Black : $r('app.color.edit_image_adjust_selected'))
      .onClick(async () => {
        // 更新 adjustMarkJudg
        this.adjustMarkJudg = false;
        // 更新 currentTask
        this.currentTask = Tasks.ADJUST;
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_mark'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_picture_native'))
          .fontColor(Color.White)
          .fontSize($r('app.float.size_16'))
      }
      .id('inner')
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        // 更新 adjustMarkJudg
        this.adjustMarkJudg = true;
        // 更新 currentTask
        this.currentTask = Tasks.MARK;
      })
      .backgroundColor(this.adjustMarkJudg ? $r('app.color.edit_image_adjust_selected') : Color.Black)
      .height('100%')
      .width('40%')
      .margin({ right: '10%' })
    }
    .height('9%')
    .width('100%')
  }

  /**
   * releasePm：执行 releasePm 相关逻辑。
   */
  releasePm(pm: PixelMap | undefined): void {
    // if 语句
    if (!pm) {
      return
    }

    pm.release().catch((err: BusinessError) => {
      logger.error('pm release failed:' + JSON.stringify(err));
    });
  }

  /**
   * CancelOrOk：执行 CancelOrOk 相关逻辑。
   */
  @Builder
  CancelOrOk(text: string | Resource) {
    // Row：水平布局容器
    Row() {
      // Flex：弹性容器
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        // Image：图片
        Image($r('app.media.ic_cancel'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
          .onClick(async () => {
            // await 语句
            await this.onEditCancel();
          })
          .margin({ left: '10%' })
          .id('cancel')

        // Text：文本
        Text(text)
          .fontColor(Color.White)
          .fontSize($r('app.float.size_18'))// 根据【修改hdr设置】文字长度，设置宽度为120
          .width(this.currentTask === Tasks.HDR ? $r('app.float.size_120') : $r('app.float.size_40'))
          .height($r('app.float.size_30'))

        // Image：图片
        Image($r('app.media.ic_ok'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
          .margin({ right: '10%' })
          .onClick(() => {
            // if 语句
            if (this.currentTask === Tasks.ENCODEJS || this.currentTask === Tasks.DECODEJS) {
              // 更新 currentTask
              this.currentTask = Tasks.ADJUST;
              // 更新 cropIndex
              this.cropIndex = 0;
            }
            // if 语句
            if (this.currentTask === Tasks.ENCODENDK || this.currentTask === Tasks.DECODENDK) {
              // 更新 currentTask
              this.currentTask = Tasks.MARK;
              // 更新 cropIndex
              this.cropIndex = 0;
            }
            // 更新 outSetValueOne
            this.outSetValueOne = 0;
          })
          .id('ok')
      }
    }
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('9%')
    .width('100%')
  }

  /**
   * getMarkTool：执行 getMarkTool 相关逻辑。
   */
  @Builder
  getMarkTool() {
    // Row：水平布局容器
    Row() {
      // List：列表容器
      List() {
        ForEach(pictureNdkDatas, (item: TaskData, index) => {
          // ListItem：列表项
          ListItem() {
            // Column：垂直布局容器
            Column() {
              // Image：图片
              Image(item.image)
                .width($r('app.float.size_30'))
                .height($r('app.float.size_30'))
              Text(item.text)
                .fontColor(Color.White)
                .fontSize($r('app.float.size_15'))
                .margin({ top: $r('app.float.size_5') })
            }
            .id(item.name)
            .justifyContent(FlexAlign.Center)
            .height('100%')
            .width('40%')
            .margin(index === 0 ? { left: '10%' } : { right: '10%' })
            .onClick(async () => {
              // await 语句
              await this.onSelectItem(item);
            })

          }
        })
      }
      .listDirection(Axis.Horizontal) // 排列方向
      .width('100%')
      .height('14%')
    }
    .backgroundColor($r('app.color.edit_image_public_background'))
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }

  /**
   * getAdjustTool：执行 getAdjustTool 相关逻辑。
   */
  @Builder
  getAdjustTool() {
    // Row：水平布局容器
    Row() {
      // List：列表容器
      List() {
        ForEach(pictureJsDatas, (item: TaskData, index) => {
          // ListItem：列表项
          ListItem() {
            // Column：垂直布局容器
            Column() {
              // Image：图片
              Image(item.image)
                .width($r('app.float.size_30'))
                .height($r('app.float.size_30'))
              Text(item.text)
                .fontColor(Color.White)
                .fontSize($r('app.float.size_15'))
                .margin({ top: $r('app.float.size_5') })
            }
            .id(item.name)
            .justifyContent(FlexAlign.Center)
            .height('100%')
            .width('40%')
            .onClick(async () => {
              // if 语句
              if (item.task !== undefined) {
                // 更新 currentTask
                this.currentTask = item.task;
              }
              // if 语句
              if (item.text !== undefined) {
                // 更新 cancelOkText
                this.cancelOkText = item.text
              }
              // 更新 originBM
              this.originBM = await copyPixelMap(this.pixelMap!) // 拷贝
              // 保存到队列
              this.pixelMapQueue.push(this.originBM);
            })
          }
        })
      }
      .listDirection(Axis.Horizontal) // 排列方向
      .height('14%')
    }
    .backgroundColor($r('app.color.edit_image_public_background'))
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }

  /**
   * TextOrStickerScroll：执行 TextOrStickerScroll 相关逻辑。
   */
  @Builder
  TextOrStickerScroll(materials: MaterialData[]) {
    // Row：水平布局容器
    Row() {
      // Scroll：滚动容器
      Scroll() {
        // List：列表容器
        List({ scroller: this.scroller }) {
          ForEach(materials, (item: MaterialData, index: number) => {
            // ListItem：列表项
            ListItem() {
              // Column：垂直布局容器
              Column() {
                // if 语句
                if (item instanceof FontColorData) {
                  // Text：文本
                  Text(item.getResource())
                    .visibility(Visibility.Hidden)
                    .width($r('app.float.size_40'))
                    .height($r('app.float.size_40'))
                } else {
                  // Image：图片
                  Image(item.getResource())
                    .width($r('app.float.size_40'))
                    .height($r('app.float.size_40'))
                }
              }
              .justifyContent(FlexAlign.Center)
              .borderRadius($r('app.float.size_10'))
              .border(this.resourceIndex === index ?
                {
                  // 字段 width：声明并维护该成员的状态
                  width: $r('app.float.size_3'),
                  // 字段 color：声明并维护该成员的状态
                  color: $r('app.color.edit_image_mark_scroll_selected'),
                  // 字段 radius：声明并维护该成员的状态
                  radius: $r('app.float.size_10')
                } : { width: $r('app.float.size_0'), color: $r('app.color.edit_image_mark_scroll') })
              .backgroundColor(this.currentTask === Tasks.STICKER ? $r('app.color.edit_image_mark_scroll') : item.getResource())
              .width($r('app.float.size_45'))
              .height($r('app.float.size_45'))
              .onClick(() => {
                // 更新 resourceIndex
                this.resourceIndex = index;
                // 更新 selectedResource
                this.selectedResource = item.getResource();
              })
            }
            .height('100%')
            .width('17%')
          })
        }
        .listDirection(Axis.Horizontal) // 排列方向
        .height('14%')
      }
      .padding({ left: $r('app.float.size_30'), right: $r('app.float.size_30') })
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Horizontal)
    }
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .width('100%')
  }

  /**
   * getTopBar：执行 getTopBar 相关逻辑。
   */
  @Builder
  getTopBar() {
    // Row：水平布局容器
    Row() {
      // Image：图片
      Image($r('app.media.ic_public_back'))
        .id('back')
        .fillColor(Color.White)
        .width($r('app.float.size_32'))
        .height($r('app.float.size_32'))
        .onClick(() => {
          router.back()
        })
    }

    .width('100%')
    .padding({ left: $r('app.float.size_14') })
    .margin({ top: $r('app.float.size_20') });
  }

  /**
   * getResolutionText：执行 getResolutionText 相关逻辑。
   */
  getResolutionText(): string {
    // const 语句
    const tip: string = getContext(this).resourceManager.getStringSync($r('app.string.edit_image_resolution'));
    // return 语句
    return tip + this.dpi;
  }

  /**
   * pictureDecodingToolJs：执行 pictureDecodingToolJs 相关逻辑。
   */
  @Builder
  pictureDecodingToolJs() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_decode_jpeg'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('jpegJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.decodingPictureJs(this.pictureStatus1, this.auxiliaryType); // jpeg
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_decode_heif'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('heifJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.heifFileName;
        // await 语句
        await this.decodingPictureJs(this.pictureStatus2, this.auxiliaryType); // heif
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * pictureEncodingToolJs：执行 pictureEncodingToolJs 相关逻辑。
   */
  @Builder
  pictureEncodingToolJs() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.source_encode_buffer'))// 0, 0
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('sourceToDataJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureJs(this.pushState1, this.outState1);
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.source_encode_file'))// 0, 1
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('sourceToFileJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureJs(this.pushState1, this.outState2);
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_encode_buffer'))// 1, 0
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('pictureToDataJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureJs(this.pushState2, this.outState1);
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_encode_file'))// 1, 1
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('pictureToFileJs')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureJs(this.pushState2, this.outState2);
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * pictureDecodingToolNdk：执行 pictureDecodingToolNdk 相关逻辑。
   */
  @Builder
  pictureDecodingToolNdk() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_decode_jpeg'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('jpegNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.decodingPictureNdk(this.auxiliaryType, this.jpegFileName);
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_decode_heif'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('heifNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.heifFileName;
        // await 语句
        await this.decodingPictureNdk(this.auxiliaryType, this.heifFileName);
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * pictureEncodingToolNdk：执行 pictureEncodingToolNdk 相关逻辑。
   */
  @Builder
  pictureEncodingToolNdk() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.source_encode_file'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('sourceToFileNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureNdk(this.jpegFileName, 'imageSource', 'file');
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.source_encode_buffer'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('sourceToDataNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureNdk(this.jpegFileName, 'imageSource', 'data');
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_encode_file'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('pictureToFileNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureNdk(this.jpegFileName, 'picture', 'file');
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.picture_encode_buffer'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('pictureToDataNdk')
      .onClick(async () => {
        // 更新 pixelMap
        this.pixelMap = null;
        // 更新 showPicture
        this.showPicture = this.jpegFileName;
        // await 语句
        await this.encodingPictureNdk(this.jpegFileName, 'picture', 'data');
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // 顶部功能区
      this.getTopBar()
      // 中间操作区
      Stack({ alignContent: Alignment.Center }) {
        // Column：垂直布局容器
        Column() {
          // Row：水平布局容器
          Row() {
            // Text：文本
            Text('Source graph：')
              .fontSize(20)
              .margin({ left: 5, right: 80 })
              .fontColor(Color.White)
            Text('Result graph：')
              .fontSize(20)
              .fontColor(Color.White)
          }
          .height(50)
          .width('100%')

          // Flex：弹性容器
          Flex({ justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Row }) {
            // Image：图片
            Image($rawfile(this.showPicture))
              .id('id_sourceImage')
              .width('100%')
              .height(300)
              .objectFit(ImageFit.Contain)
              .margin(5)
            Image(this.pixelMap)
              .id('id_resultImage')
              .width('100%')
              .height(300)
              .objectFit(ImageFit.Contain)
              .margin(5)
          }
        }
      }.layoutWeight(1)
      .onAreaChange((newValue: Area) => {
        // 更新 containerArea
        this.containerArea = newValue;
      })

      // 底部菜单栏
      Column() {
        // if 语句
        if (this.currentTask === Tasks.MARK) {
          // 更新 getMarkTool
          this.getMarkTool();
        } else if (this.currentTask === Tasks.ADJUST) {
          // 更新 getAdjustTool
          this.getAdjustTool();
        } else if (this.currentTask === Tasks.ENCODEJS) {
          // 更新 pictureEncodingToolJs
          this.pictureEncodingToolJs();
        } else if (this.currentTask === Tasks.DECODEJS) {
          // 更新 pictureDecodingToolJs
          this.pictureDecodingToolJs();
        } else if (this.currentTask === Tasks.ENCODENDK) {
          // 更新 pictureEncodingToolNdk
          this.pictureEncodingToolNdk();
        } else if (this.currentTask === Tasks.DECODENDK) {
          // 更新 pictureDecodingToolNdk
          this.pictureDecodingToolNdk();
        }
        // if 语句
        if (this.currentTask === Tasks.MARK || this.currentTask === Tasks.ADJUST) {
          // 更新 getFirstLvMenu
          this.getFirstLvMenu();
        } else {
          // 更新 CancelOrOk
          this.CancelOrOk(this.cancelOkText!);
        }
      }
      .width('100%')
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}