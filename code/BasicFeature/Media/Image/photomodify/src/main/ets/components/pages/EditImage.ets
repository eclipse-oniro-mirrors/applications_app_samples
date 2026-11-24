/*
 * Copyright (c) 2023-2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file src/main/ets/components/pages/EditImage.ets
 * 文件职责：EditImage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：EditImage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { logger } from '../util/Logger';
import { copyPixelMap } from '../util/CopyObj';
import { adjustDatas, cropTaskDatas, markDatas } from '../model/AdjustModels';
import { CropTasks, TaskData, Tasks } from '../model/AdjustData';
import { ScalePhotoPage } from '../pages/ScalePhotoPage';
import MaterialEdit from './MaterialEdit';
import InputTextDialog from './InputTextDialog';
import PixelMapQueue from '../feature/PixelMapQueue';
import { readImage } from '../util/MediaUtil';
import { FontColorData, MaterialData } from '../model/MaterialData';
import { fontColors, stickers } from '../model/MaterialModels';
import { getContainSize, Size } from '../util/ImageUtil';
import { ImageTest } from '../util/FileUtil';
import { BusinessError } from '@ohos.base';
import { ColorSpacePage } from './ColorSpacePage';
import { LoadingDialog } from '@kit.ArkUI';

// const 语句
const TAG: string = '[Sample_EditImage]';

/**
 * EditImage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct EditImage {
  // @State mediaUris：组件内部状态
  @State mediaUris: string = (router.getParams() as Record<string, Object>)['mediaUris'] as string;

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

  // @State cropFlag：组件内部状态
  @State cropFlag: boolean = false;

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

  // 字段 pixelMapQueue：声明并维护该成员的状态
  private pixelMapQueue: PixelMapQueue = new PixelMapQueue();

  // 字段 test：声明并维护该成员的状态
  private test = new ImageTest();

  /**
   * onOpen：执行 onOpen 相关逻辑。
   */
  onOpen(): void {
    // if 语句
    if (this.loading) {
      return;
    }
    // 更新 loading
    this.loading = true;
    // 更新 loadingDialogController
    this.loadingDialogController.open();
  }

  /**
   * onClose：执行 onClose 相关逻辑。
   */
  onClose(): void {
    // 更新 loading
    this.loading = false;
    // 更新 loadingDialogController
    this.loadingDialogController.close();
  }

  /**
   * 输入文字素材弹窗
   */
  dialogController: CustomDialogController | undefined = new CustomDialogController({
    // 字段 builder：声明并维护该成员的状态
    builder: InputTextDialog({
      // 字段 cancel：声明并维护该成员的状态
      cancel: (): void => this.onCancel(),
      // 字段 confirm：声明并维护该成员的状态
      confirm: (): void => this.onAccept(),
      // 字段 inputValue：声明并维护该成员的状态
      inputValue: $inputValue
    }),
    // 字段 cancel：声明并维护该成员的状态
    cancel: (): void => this.existApp(),
    // 字段 autoCancel：声明并维护该成员的状态
    autoCancel: true,
    // 字段 alignment：声明并维护该成员的状态
    alignment: DialogAlignment.Bottom,
    // 字段 offset：声明并维护该成员的状态
    offset: { dx: 0, dy: -20 },
    // 字段 gridCount：声明并维护该成员的状态
    gridCount: 4,
    // 字段 customStyle：声明并维护该成员的状态
    customStyle: false
  });

  /**
   * 加载弹窗
   */
  loadingDialogController: CustomDialogController = new CustomDialogController({
    // 字段 builder：声明并维护该成员的状态
    builder: LoadingDialog({
      // 字段 content：声明并维护该成员的状态
      content: $r('app.string.Processing')
    })
  });

  /**
   * onCancel：执行 onCancel 相关逻辑。
   */
  onCancel(): void {
    console.info('Callback when the first button is clicked');
  }

  /**
   * onAccept：执行 onAccept 相关逻辑。
   */
  onAccept(): void {
    // if 语句
    if (this.inputValue !== null && this.inputValue.length > 0) {
      // 更新 currentTask
      this.currentTask = Tasks.TEXT;
    }
    // 更新 onSelectItem
    this.onSelectItem(markDatas[0], true);
  }

  /**
   * onEditCancel：执行 onEditCancel 相关逻辑。
   */
  async onEditCancel(): Promise<void> {
    // if 语句
    if (this.currentTask === Tasks.CROP || this.currentTask === Tasks.SCALE ||
    this.currentTask === Tasks.ROTATE || this.currentTask === Tasks.TONING || this.currentTask === Tasks.COLORSPACE ||
      this.currentTask === Tasks.HDR) {
      // 更新 currentTask
      this.currentTask = Tasks.ADJUST;
      // 更新 cropIndex
      this.cropIndex = 0;
    }
    // if 语句
    if (this.currentTask === Tasks.TEXT || this.currentTask === Tasks.STICKER) {
      // 更新 currentTask
      this.currentTask = Tasks.MARK;
      // 更新 cropIndex
      this.cropIndex = 0;
    }
    // if 语句
    if (this.currentTask === Tasks.CROP) {
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
   * existApp：执行 existApp 相关逻辑。
   */
  existApp(): void {
    console.info('Click the callback in the blank area')
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  async aboutToAppear(): Promise<void> {
    // 更新 pixelMap
    this.pixelMap = await readImage(this.mediaUris);
    // if 语句
    if (this.pixelMap !== null) {
      // 更新 originBM
      this.originBM = await copyPixelMap(this.pixelMap);
    }
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear(): void {
    // 更新 dialogController
    this.dialogController = undefined
  }

  /**
   * 选择子菜单
   * @param item
   * @param hasInputText
   */
  async onSelectItem(item: TaskData, hasInputText: boolean = false): Promise<void> {
    // if 语句
    if (hasInputText || item.task !== Tasks.TEXT) {
      // 只有hasInputText，才是图片素材模式，其他都是贴纸
      this.isTextMaterial = hasInputText;
      // 更新 resourceIndex
      this.resourceIndex = 0;
      // 更新 isCancelQuit
      this.isCancelQuit = false;
      // if 语句
      if (item.task !== undefined) {
        // 更新 currentTask
        this.currentTask = item.task;
      }

      // if 语句
      if (item.text !== undefined) {
        // 更新 cancelOkText
        this.cancelOkText = item.text;
      }

      // if 语句
      if (this.pixelMap) {
        // 更新 originBM
        this.originBM = await copyPixelMap(this.pixelMap);
      }
      // 保存到队列
      if (this.originBM !== null && this.originBM !== undefined) {
        // 更新 pixelMapQueue
        this.pixelMapQueue.push(this.originBM);
      }
    } else if (item.task === Tasks.TEXT) {
      // 更新 dialogController
      this.dialogController?.open();
    }
  }

  /**
   * 撤销功能
   */
  async repeal(): Promise<void> {
    // const 语句
    const pm: image.PixelMap | undefined = this.pixelMapQueue.pop();
    // if 语句
    if (pm !== null && pm !== undefined) {
      // 更新 pixelMap
      this.pixelMap = await copyPixelMap(pm);
    }
  }

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
   * 亮度调节
   */
  async brightChange(): Promise<void> {
    // let 语句
    let headFilter: effectKit.Filter = effectKit.createEffect(this.brightnessOriginBM);
    // if 语句
    if (headFilter !== null && !this.isBrightChanging) {
      // 更新 isBrightChanging
      this.isBrightChanging = true;
      headFilter.brightness(this.brightnessValue);
      // 更新 pixelMap
      this.pixelMap = await headFilter.getEffectPixelMap();
      // 更新 flushPage
      this.flushPage();
      // 更新 isBrightChanging
      this.isBrightChanging = false;
    }
  }

  /**
   * 图片裁剪
   * @param proportion
   */
  async cropImage(proportion: number): Promise<void> {
    // if 语句
    if (!this.pixelMap) {
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
    // if 语句
    if (!imageInfo) {
      return;
    }
    // let 语句
    let imageHeight: number = imageInfo.size.height;
    // let 语句
    let imageWith: number = imageInfo.size.width;
    logger.info(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    // if 语句
    if (proportion === 1) {
      // if 语句
      if (imageHeight > imageWith) {
        // 字段 imageHeight：声明并维护该成员的状态
        imageHeight = imageWith;
      } else {
        // 字段 imageWith：声明并维护该成员的状态
        imageWith = imageHeight;
      }
      logger.info(TAG, `imageHeight = ${JSON.stringify(imageHeight)},imageWith = ${JSON.stringify(imageWith)}`);
    }
    // try 语句
    try {
      // 更新 pixelMap
      this.pixelMap.cropSync({
        // 字段 size：声明并维护该成员的状态
        size: { height: imageHeight / proportion, width: imageWith },
        // 字段 x：声明并维护该成员的状态
        x: 0,
        // 字段 y：声明并维护该成员的状态
        y: 0
      });
      // 更新 isPixelMapChange
      this.isPixelMapChange = !this.isPixelMapChange;
    } catch (error) {
      logger.info(TAG, `crop error = ${JSON.stringify(error)}`);
    }
    // 更新 flushPage
    this.flushPage();
  }

  /**
   * 图片解码
   * @param decodingType 解码类型(0:AUTO,1:SDR,2:HDR)
   * @returns
   */
  async decodingImage(decodingType:number):Promise<void>{
    logger.info(TAG, 'decodingImage start');
    // let 语句
    let decodingOptions: image.DecodingOptions = {
      // 字段 editable：声明并维护该成员的状态
      editable: true,
      // 字段 desiredDynamicRange：声明并维护该成员的状态
      desiredDynamicRange: decodingType
    };
    logger.debug(TAG, `decoding Type = ${decodingType}`);
    // 更新 pixelMap
    this.pixelMap = await readImage(this.mediaUris, decodingOptions);
    // if 语句
    if (!this.pixelMap) {
      logger.info(TAG, `decodingImage no pixelMap`);
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
        Text($r('app.string.edit_image_adjust'))
          .fontColor(Color.White)
          .fontSize($r('app.float.size_16'))
      }
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
        Text($r('app.string.edit_image_mark'))
          .fontColor(Color.White)
          .fontSize($r('app.float.size_16'))
      }
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
      logger.error('pm release异常:' + JSON.stringify(err));
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
          .id('Cancel')

        // Text：文本
        Text(text)
          .fontColor(Color.White)
          .fontSize($r('app.float.size_18'))
          // 根据【修改hdr设置】文字长度，设置宽度为120
          .width(this.currentTask === Tasks.HDR ? $r('app.float.size_120') : $r('app.float.size_40'))
          .height($r('app.float.size_30'))

        // Image：图片
        Image($r('app.media.ic_ok'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
          .margin({ right: '10%' })
          .onClick(() => {
            // if 语句
            if (this.currentTask === Tasks.CROP || this.currentTask === Tasks.SCALE ||
            this.currentTask === Tasks.ROTATE || this.currentTask === Tasks.TONING || this.currentTask === Tasks.COLORSPACE ||
              this.currentTask === Tasks.HDR) {
              // 更新 currentTask
              this.currentTask = Tasks.ADJUST;
              // 更新 cropIndex
              this.cropIndex = 0;
            }
            // if 语句
            if (this.currentTask === Tasks.TEXT || this.currentTask === Tasks.STICKER) {
              // 更新 currentTask
              this.currentTask = Tasks.MARK;
              // 更新 cropIndex
              this.cropIndex = 0;
            }
            // 更新 outSetValueOne
            this.outSetValueOne = 0;
          })
          .id('Ok')
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
        ForEach(markDatas, (item: TaskData, index) => {
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
            .justifyContent(FlexAlign.Center)
            .height('100%')
            .width('40%')
            .margin(index === 0 ? { left: '10%' } : { right: '10%' })
            .onClick(async () => {
              // 更新 onSelectItem
              this.onSelectItem(item);
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
   * getCropTool：执行 getCropTool 相关逻辑。
   */
  @Builder
  getCropTool() {
    // Row：水平布局容器
    Row() {
      // List：列表容器
      List() {
        ForEach(cropTaskDatas, (item: TaskData, index: number) => {
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
                .fontSize($r('app.float.size_14'))
                .margin({ top: $r('app.float.size_5') })
            }
            .backgroundColor(this.cropIndex === index ? $r('app.color.edit_image_public_background') : $r('app.color.edit_image_crop_select'))
            .justifyContent(FlexAlign.Center)
            .height('100%')
            .width('25%')
            .onClick(async () => {
              // if 语句
              if (item.task !== undefined) {
                // 更新 currentCropTask
                this.currentCropTask = item.task;
              }
              // 更新 pixelMap
              this.pixelMap = await copyPixelMap(this.originBM !); // 拷贝
              this.flushPage();
              // 更新 cropIndex
              this.cropIndex = index;
              // if 语句
              if (this.currentCropTask === CropTasks.ORIGIN) { // 原图
                this.pixelMap = await readImage(this.mediaUris);
              } else if (this.currentCropTask === CropTasks.ONE_ONE) {
                // await 语句
                await this.cropImage(1);
                console.log(TAG + 'CropTasks  this.cropImage(1)' + this.currentCropTask)
              } else if (this.currentCropTask === CropTasks.THREE_FOUR) {
                // await 语句
                await this.cropImage(4 / 3);
                console.log(TAG + 'CropTasks  cropImage(4 / 3)==' + this.currentTask)
              } else if (this.currentCropTask === CropTasks.NINE_SIXTH) {
                // await 语句
                await this.cropImage(16 / 9);
                console.log(TAG + 'CropTasks  (16 / 9)==' + this.currentTask);
              }
            })
          }
        })
      }
      .listDirection(Axis.Horizontal) // 排列方向
      .height('14%')
    }
    .width('100%')
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
        ForEach(adjustDatas, (item: TaskData, index) => {
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
            .justifyContent(FlexAlign.Center)
            .height('100%')
            .width('25%')
            .onClick(async () => {
              // if 语句
              if (item.task !== undefined) {
                // 更新 currentTask
                this.currentTask = item.task;
              }
              // if 语句
              if (this.currentTask === Tasks.SCALE) {
                // 更新 computeDpiPosition
                this.computeDpiPosition();
              }
              // if 语句
              if (item.task === Tasks.TONING) {
                // 更新 brightnessOriginBM
                this.brightnessOriginBM = this.pixelMap;
              }
              // if 语句
              if (item.text !== undefined) {
                // 更新 cancelOkText
                this.cancelOkText = item.text
              }
              // 更新 originBM
              this.originBM = await copyPixelMap(this.pixelMap !) // 拷贝
              if (item.task === Tasks.ROTATE) {
                // 更新 pixelMap
                this.pixelMap = await copyPixelMap(this.originBM);
              }
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
   * getScaleTool：执行 getScaleTool 相关逻辑。
   */
  @Builder
  getScaleTool() {
    // ScalePhotoPage：ScalePhotoPage 自定义组件
    ScalePhotoPage({ pixelMap: $pixelMap, dpi: $dpi })
      .backgroundColor($r('app.color.edit_image_public_background'))
      .height('14%')
      .width('100%')
      .padding({ top: $r('app.float.size_10') })
  }

  /**
   * getColorSpaceTool：执行 getColorSpaceTool 相关逻辑。
   */
  @Builder
  getColorSpaceTool() {
    // ColorSpacePage：ColorSpacePage 自定义组件
    ColorSpacePage({ pixelMap: $pixelMap, dpi: $dpi })
      .backgroundColor($r('app.color.edit_image_public_background'))
      .height('14%')
      .width('100%')
      .padding({ top: $r('app.float.size_10') })
  }

  /**
   * getRotateTool：执行 getRotateTool 相关逻辑。
   */
  @Builder
  getRotateTool() {
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotateto90'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_image_rotate_90'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('90')
      .onClick(async () => {
        // if 语句
        if (this.canClick) {
          // 更新 canClick
          this.canClick = false;
          // 更新 isPixelMapChange
          this.isPixelMapChange = true;
          // await 语句
          await this.pixelMap?.rotate(90);
          setTimeout(() => {
            // 更新 canClick
            this.canClick = true;
            // 更新 isPixelMapChange
            this.isPixelMapChange = false;
            // 更新 flushPage
            this.flushPage();
          }, 300)
        }
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_image_rotate_down_90'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('-90')
      .onClick(async () => {
        // if 语句
        if (this.canClick) {
          // 更新 canClick
          this.canClick = false;
          // 更新 isPixelMapChange
          this.isPixelMapChange = true;
          // await 语句
          await this.pixelMap?.rotate(-90);
          setTimeout(() => {
            // 更新 canClick
            this.canClick = true;
            // 更新 isPixelMapChange
            this.isPixelMapChange = false;
            // 更新 flushPage
            this.flushPage();
          }, 300);
        }
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * getToningTool：执行 getToningTool 相关逻辑。
   */
  @Builder
  getToningTool() {
    // Row：水平布局容器
    Row() {
      // Row：水平布局容器
      Row() {
        // Slider：Slider 自定义组件
        Slider({
          // 字段 value：声明并维护该成员的状态
          value: this.outSetValueOne,
          // 字段 min：声明并维护该成员的状态
          min: 0,
          // 字段 max：声明并维护该成员的状态
          max: 30,
          // 字段 style：声明并维护该成员的状态
          style: SliderStyle.OutSet,
        })
          .id('Slider')
          .trackThickness($r('app.float.size_5'))
          .trackColor($r('app.color.edit_image_slider_trackColor'))
          .selectedColor($r('app.color.edit_image_slider_selected'))
          .onChange(async (value: number, mode: SliderChangeMode) => {
            // 更新 outSetValueOne
            this.outSetValueOne = value;
            // 更新 brightnessValue
            this.brightnessValue = Number((value / 100).toFixed(2));
            // await 语句
            await this.brightChange();
          })
      }
      .height('14%')
      .width('96%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .backgroundColor($r('app.color.edit_image_public_background'))
  }

  /**
   * getDecodingTool：执行 getDecodingTool 相关逻辑。
   */
  @Builder
  getDecodingTool(){
    // Row：水平布局容器
    Row() {
      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotate'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_image_decoding_auto'))
          .margin({ top: $r('app.float.size_5') })
          .fontSize($r('app.float.size_14'))
          .fontColor(Color.White)
      }
      .id('auto')
      .onClick(async () => {
        // if 语句
        if (this.canClick) {
          // 更新 canClick
          this.canClick = false;
          // await 语句
          await this.decodingImage(image.DecodingDynamicRange.AUTO);
          setTimeout(() => {
            // 更新 canClick
            this.canClick = true;
          }, 300)
        }
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotateto90'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_image_decoding_sdr'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('sdr')
      .onClick(async () => {
        // if 语句
        if (this.canClick) {
          // 更新 canClick
          this.canClick = false;
          // await 语句
          await this.decodingImage(image.DecodingDynamicRange.SDR);
          setTimeout(() => {
            // 更新 canClick
            this.canClick = true;
          }, 300)
        }
      })

      // Column：垂直布局容器
      Column() {
        // Image：图片
        Image($r('app.media.ic_rotateto90'))
          .width($r('app.float.size_30'))
          .height($r('app.float.size_30'))
        Text($r('app.string.edit_image_decoding_hdr'))
          .margin({ top: $r('app.float.size_5') })
          .fontColor(Color.White)
          .fontSize($r('app.float.size_14'))
      }
      .id('hdr')
      .onClick(async () => {
        // if 语句
        if (this.canClick) {
          // 更新 canClick
          this.canClick = false;
          // await 语句
          await this.decodingImage(image.DecodingDynamicRange.HDR);
          setTimeout(() => {
            // 更新 canClick
            this.canClick = true;
          }, 300)
        }
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.edit_image_public_background'))
    .height('14%')
    .width('100%')
  }

  /**
   * getMaterialTool：执行 getMaterialTool 相关逻辑。
   */
  @Builder
  getMaterialTool(materials: MaterialData[]) {
    // 更新 TextOrStickerScroll
    this.TextOrStickerScroll(materials)
  }

  /**
   * onSave：执行 onSave 相关逻辑。
   */
  async onSave(): Promise<void> {
    // if 语句
    if (this.loading) {
      return;
    }
    // 更新 loading
    this.loading = true;
    // 更新 loadingDialogController
    this.loadingDialogController.open();

    // if 语句
    if (this.pixelMap !== undefined && this.pixelMap !== null) {
      // const 语句
      const uri: string = await this.test.savePixelMap(getContext(this), this.pixelMap);
      logger.debug('保存图片地址为:' + uri);
      router.pushUrl({
        // 字段 url：声明并维护该成员的状态
        url: 'pages/Index',
        // 字段 params：声明并维护该成员的状态
        params: { isShowCamera: true }
      });
      // 更新 onClose
      this.onClose();
    }

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
      Image($r("app.media.ic_public_back"))
        .fillColor(Color.White)
        .width($r('app.float.size_32'))
        .height($r('app.float.size_32'))
        .onClick(() => {
          router.back();
        })
      Blank()
      // 非编辑模式，展示撤回和保存功能
      if (this.currentTask === Tasks.ADJUST || this.currentTask === Tasks.MARK || this.currentTask === Tasks.HDR) {
        // Row：水平布局容器
        Row({ space: 24 }) {
          // Image：图片
          Image($r('app.media.ic_public_tosmall'))
            .height($r('app.float.size_32'))
            .width($r('app.float.size_32'))
            .id('Repeal')
            .onClick(async () => {
              // 更新 repeal
              this.repeal();
            })
          Image($r('app.media.ic_public_save'))
            .height($r('app.float.size_32'))
            .width($r('app.float.size_32'))
            .id('Save')
            .onClick(() => {
              // 更新 onSave
              this.onSave();
            })
        }.margin({ right: $r('app.float.size_10') })
      }
    }
    .width('100%')
    .padding({ left: $r('app.float.size_14') })
    .margin({ top: $r('app.float.size_20') });
  }

  /**
   * computeDpiPosition：执行 computeDpiPosition 相关逻辑。
   */
  async computeDpiPosition(): Promise<void> {
    // if 语句
    if (this.containerArea === null || this.pixelMap === null || this.pixelMap === undefined) {
      return;
    }
    // let 语句
    let imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo()
    if (!imageInfo) {
      return;
    }
    // const 语句
    const imageHeight: number = imageInfo.size.height;
    // const 语句
    const imageWith: number = imageInfo.size.width;
    // 更新 dpi
    this.dpi = imageWith + "*" + imageHeight;
    // 计算容器宽高
    const containerHeight: number = Number(this.containerArea.height);
    // const 语句
    const containerWidth: number = Number(this.containerArea.width);
    // const 语句
    const size: Size = getContainSize(containerWidth * 0.9, containerHeight * 0.9, imageWith, imageHeight);
    // 计算左上角的坐标
    const x: number = containerWidth / 2 + size.width / 2;
    // const 语句
    const y: number = containerHeight / 2 - size.height / 2;
    // 最终坐标还要除去控件宽高
    this.dpiX = x - 100;
    // 更新 dpiY
    this.dpiY = y;
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
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // 顶部功能区
      this.getTopBar()
      // 中间操作区
      if (this.currentTask === Tasks.TEXT || this.currentTask === Tasks.STICKER) {
        // Stack：层叠容器
        Stack() {
          MaterialEdit({
            // 字段 pixelMap：声明并维护该成员的状态
            pixelMap: $pixelMap,
            // 字段 text：声明并维护该成员的状态
            text: this.inputValue,
            // 字段 isCancelQuit：声明并维护该成员的状态
            isCancelQuit: this.isCancelQuit,
            // 字段 selectedMaterialIndex：声明并维护该成员的状态
            selectedMaterialIndex: this.resourceIndex,
            // 字段 isTextMaterial：声明并维护该成员的状态
            isTextMaterial: this.isTextMaterial,
            // 字段 onCancel：声明并维护该成员的状态
            onCancel: (): Promise<void> => this.onEditCancel(),
            // 字段 onOpen：声明并维护该成员的状态
            onOpen: (): void => this.onOpen(),
            // 字段 onClose：声明并维护该成员的状态
            onClose: (): void => this.onClose()
          }).width('90%')
            .height('90%')
        }.layoutWeight(1)
      } else {
        // Stack：层叠容器
        Stack({ alignContent: Alignment.Center }) {
          // if 语句
          if (this.isPixelMapChange) {
            // Image：图片
            Image(this.pixelMap)
              .objectFit(ImageFit.Contain)
              .width('90%')
              .height('90%')
              .dynamicRangeMode(DynamicRangeMode.HIGH)
              .backgroundColor($r('app.color.edit_image_stack_image'))
              .alignRules(
                {
                  // 字段 middle：声明并维护该成员的状态
                  middle: { anchor: '__container__', align: HorizontalAlign.Center },
                  // 字段 center：声明并维护该成员的状态
                  center: { anchor: '__container__', align: VerticalAlign.Center }
                }
              )
              .id('sourceImage')
          } else {
            // Image：图片
            Image(this.pixelMap)
              .objectFit(ImageFit.Contain)
              .width('90%')
              .height('90%')
              .dynamicRangeMode(DynamicRangeMode.HIGH)
              .backgroundColor($r('app.color.edit_image_stack_image'))
              .alignRules(
                {
                  // 字段 middle：声明并维护该成员的状态
                  middle: { anchor: '__container__', align: HorizontalAlign.Center },
                  // 字段 center：声明并维护该成员的状态
                  center: { anchor: '__container__', align: VerticalAlign.Center }
                }
              )
              .id('resultImage')
          }

          // if 语句
          if (this.currentTask === Tasks.SCALE) {
            Stack() {
              Text(this.getResolutionText())
                .fontSize($r('app.float.size_14'))
                .fontColor(Color.White)
            }
            .position({ x: this.dpiX, y: this.dpiY })
            .backgroundColor($r('app.color.edit_image_stack_resolution'))
            .id('dpi')
            .padding($r('app.float.size_10'))
            .width($r('app.float.size_100'))
            .height($r('app.float.size_80'))
            .border({ radius: $r('app.float.size_20') })
          }
        }.layoutWeight(1)
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.containerArea = newValue;
        })
      }
      // 底部菜单栏
      Column() {
        if (this.currentTask === Tasks.MARK) {
          this.getMarkTool();
        } else if (this.currentTask === Tasks.ADJUST) {
          this.getAdjustTool();
        } else if (this.currentTask === Tasks.CROP) {
          this.getCropTool();
        } else if (this.currentTask === Tasks.SCALE) {
          this.getScaleTool();
        } else if (this.currentTask === Tasks.ROTATE) {
          this.getRotateTool();
        } else if (this.currentTask === Tasks.TONING) {
          this.getToningTool();
        } else if (this.currentTask === Tasks.COLORSPACE) {
          this.getColorSpaceTool();
        } else if (this.currentTask === Tasks.TEXT) {
          this.getMaterialTool(fontColors);
        } else if (this.currentTask === Tasks.STICKER) {
          this.getMaterialTool(stickers);
        } else if (this.currentTask === Tasks.HDR) {
          this.getDecodingTool();
        }
        if (this.currentTask === Tasks.MARK || this.currentTask === Tasks.ADJUST) {
          this.getFirstLvMenu();
        } else {
          this.CancelOrOk(this.cancelOkText !);
        }
      }
      .width('100%')
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}