/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file src/main/ets/components/pages/MaterialEdit.ets
 * 文件职责：MaterialEdit 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MaterialEdit。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import image from '@ohos.multimedia.image';
import { logger } from '../util/Logger';
import ComputeFeature, { NodeType } from '../feature/ComputeFeature';
import { fontColors, stickers } from '../model/MaterialModels';
import { drawSvg } from '../util/SvgUtil';
import { getContainSize, Size } from '../util/ImageUtil';
import { offsetOrigin, Point, transformCoordinates } from '../util/CoordinatesUtil';

// const 语句
const TAG: string = '[Sample_MaterialEdit]';

/**
 * 素材编辑组件，
 * 1、图片背景，不需要动
 * 2、素材组件，边框+文字或者图片
 * 3、边框支持拖动和关闭
 *
 * 输入：传入背景图、素材来源
 * 输出：返回素材size和位置
 */
/**
 * MaterialEdit：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export default struct MaterialEdit {
  // @Link pixelMap：与父组件双向绑定的状态
  @Link pixelMap: PixelMap;

  // @Prop text：父组件传入的属性
  @Prop text: string;

  // 退出的时候，是否是取消操作
  // @Prop isCancelQuit：父组件传入的属性
  @Prop isCancelQuit: boolean;

  // @Prop selectedMaterialIndex：父组件传入的属性
  @Prop selectedMaterialIndex: number;

  // @Prop isTextMaterial：父组件传入的属性
  @Prop isTextMaterial: boolean;

  // 字段 onCancel：声明并维护该成员的状态
  onCancel: () => void = () => {};

  // 字段 onOpen：声明并维护该成员的状态
  onOpen: () => void = () => {};

  // 字段 onClose：声明并维护该成员的状态
  onClose: () => void = () => {};

  // 容器尺寸
  containerHeight: number = 0;

  // 字段 containerWidth：声明并维护该成员的状态
  containerWidth: number = 0;

  // 图片的尺寸
  imageHeight: number = 0;

  // 字段 imageWidth：声明并维护该成员的状态
  imageWidth: number = 0;

  // 图片实际的显示尺寸
  actualImageHeight: number = 0;

  // 字段 actualImageWidth：声明并维护该成员的状态
  actualImageWidth: number = 0;

  // @State materialWidth：组件内部状态
  @State materialWidth: number = 0;

  // @State materialHeight：组件内部状态
  @State materialHeight: number = 0;

  // @State fontSize：组件内部状态
  @State fontSize: number = 0;

  // @State centerX：组件内部状态
  @State centerX: number = 0;

  // @State centerY：组件内部状态
  @State centerY: number = 0;

  // @State scalePercent：组件内部状态
  @State scalePercent: number = 1;

  // 初始化配置
  originWidth: number = 120;

  // 字段 originHeight：声明并维护该成员的状态
  originHeight: number = 120;

  // 字段 originFontSize：声明并维护该成员的状态
  originFontSize: number = 30;

  // 字段 eventType：声明并维护该成员的状态
  eventType: string = '';

  // 字段 panOption：声明并维护该成员的状态
  panOption: PanGestureOptions = new PanGestureOptions();

  // 字段 computeFeature：声明并维护该成员的状态
  computeFeature: ComputeFeature = new ComputeFeature();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  async aboutToAppear(): Promise<void> {
    // 更新 getMaterialWidth
    this.getMaterialWidth();
    // 更新 computeFeature
    this.computeFeature.setFontSize(this.fontSize);
  }

  /**
   * 保存当前的素材
   */
  async aboutToDisappear(): Promise<void> {
    // 更新 onOpen
    this.onOpen();
    // await 语句
    await this.saveChange();
    // 更新 onClose
    this.onClose();
  }

  /**
   * saveChange：执行 saveChange 相关逻辑。
   */
  async saveChange(): Promise<void> {
    // const 语句
    const pm: image.PixelMap = this.pixelMap;
    // if 语句
    if (!this.isCancelQuit && pm !== null) {
      // const 语句
      const width: number = px2vp(this.imageWidth);
      // const 语句
      const height: number = px2vp(this.imageHeight);
      // const 语句
      const settings: RenderingContextSettings = new RenderingContextSettings(true);
      // const 语句
      const offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(width, height, settings);
      // 绘制背景
      offContext.drawImage(pm, 0, 0, width, height);

      // let 语句
      let point: Point = new Point(this.centerX, this.centerY);
      // 计算坐标系左上角坐标
      const leftTopPointX: number = this.containerWidth / 2 - this.actualImageWidth / 2;
      // const 语句
      const leftTopPointY: number = this.containerHeight / 2 - this.actualImageHeight / 2;
      // 计算中心点，在编辑模式下的坐标
      point = offsetOrigin(point, leftTopPointX, leftTopPointY);
      // 编辑和实际尺寸的缩放比例
      const scale: number = px2vp(this.imageWidth) / this.actualImageWidth;
      // 乘以系数，还原到在原图尺寸的坐标
      point = transformCoordinates(point, scale);
      // if 语句
      if (this.isTextMaterial) {
        // 绘制文字
        const resource: Resource | undefined = fontColors[this.selectedMaterialIndex].getName();
        if(resource !== undefined){
          // const 语句
          const colorString: string = await this.convertResourceToString(resource);
          offContext.fillStyle = colorString;
          // const 语句
          const fontPx: number = fp2px(this.fontSize * scale);
          offContext.font = fontPx + 'px sans-serif';
          // const 语句
          const measure: TextMetrics = offContext.measureText(this.text);
          // const 语句
          const textWidth: number = measure.width;
          // const 语句
          const textHeight: number = measure.height;
          // 写入点是素材的左下角,所以要加入图片宽高的偏移量
          point = offsetOrigin(point, textWidth / 2, -textHeight / 2)
          offContext.fillText(this.text, point.x, point.y);
        }
      } else {
        // 绘制贴图
        const imgResource: Resource | undefined = stickers[this.selectedMaterialIndex].getResource();
        // if 语句
        if (imgResource !== undefined) {
          // const 语句
          const imgWidth: number = this.originWidth * this.scalePercent * scale;
          // const 语句
          const imgHeight: number = this.originHeight * this.scalePercent * scale;
          // 写入的坐标是素材的左上角坐标
          point = offsetOrigin(point, imgWidth / 2, imgHeight / 2);
          // await 语句
          await drawSvg(getContext(this), offContext, imgResource, imgWidth, imgHeight, point.x, point.y);

        }
      }
      // 获取新的pm
      const newPm: image.PixelMap = offContext.getPixelMap(0, 0, width, height);
      // 更新 pixelMap
      this.pixelMap = newPm;
    }
  }

  /**
   * convertResourceToString：执行 convertResourceToString 相关逻辑。
   */
  async convertResourceToString(resource: Resource): Promise<string> {
    // return 语句
    return await getContext(this).resourceManager.getStringValue(resource);
  }

  /**
   * getMaterialWidth：执行 getMaterialWidth 相关逻辑。
   */
  getMaterialWidth(): void {
    // 更新 materialWidth
    this.materialWidth = this.originWidth + this.originFontSize * this.text.length;
    // 更新 materialHeight
    this.materialHeight = this.originHeight;
    // 更新 fontSize
    this.fontSize = this.originFontSize;
    logger.debug('this.materialWidth=' + this.materialWidth);
    // 更新 computeFeature
    this.computeFeature.setOriginMaterialSize(this.materialWidth, this.materialHeight);
  }

  /**
   * onActionStart：执行 onActionStart 相关逻辑。
   */
  onActionStart(event: GestureEvent, nodeType: NodeType): void {
    console.info('Pan start');
    // 更新 computeFeature
    this.computeFeature.startDrag(nodeType);
  }

  /**
   * onActionUpdate：执行 onActionUpdate 相关逻辑。
   */
  onActionUpdate(event: GestureEvent): void {
    logger.info('Pan end,offsetX=' + event.offsetX + ',offsetY=' + event.offsetY);
    // 更新 computeFeature
    this.computeFeature.onDrag(event.offsetX, event.offsetY, (w: number, h: number, scale: number, fontSize: number) => {
      this.materialHeight = h;
      this.materialWidth = w;
      this.fontSize = fontSize;
      this.scalePercent = scale;
    });
  }

  /**
   * onActionEnd：执行 onActionEnd 相关逻辑。
   */
  onActionEnd(): void {
    this.computeFeature.endDrag();
  }

  /**
   * 相对于中心点的偏移量，-1/2素材宽，-1/2素材高
   */
  getMarkAnchorPosition(): Position {
    const dx: number = this.materialWidth / 2;
    const dy: number = this.materialHeight / 2;
    return {
      x: dx,
      y: dy
    };
  }

  /**
   * getPosition：执行 getPosition 相关逻辑。
   */
  getPosition(): Position {
    return {
      x: this.centerX,
      y: this.centerY
    };
  }

  /**
   * getMaterialStyle：执行 getMaterialStyle 相关逻辑。
   */
  @Styles
  getMaterialStyle() {
    .alignRules(
      this.getAlignRule(NodeType.CENTER_MATERIAL)
    )
    .id('material')
    .gesture(PanGesture(this.panOption)
      .onActionStart((event: GestureEvent) => {
        this.onActionStart(event, NodeType.CENTER_MATERIAL);
      })
      .onActionUpdate((event: GestureEvent) => {
        logger.info('Pan end,offsetX=' + event.offsetX + ',offsetY=' + event.offsetY);
        this.computeFeature.onDragCenter(event.offsetX, event.offsetY, (x: number, y: number) => {
          this.centerX = x;
          this.centerY = y;
          return null;
        });
      })
      .onActionEnd(() => {
        this.onActionEnd();
      }))
  }

  /**
   * getImageResource：执行 getImageResource 相关逻辑。
   */
  getImageResource(): Resource | undefined {
    return stickers[this.selectedMaterialIndex].getResource();
  }

  /**
   * getMaterialBuilder：执行 getMaterialBuilder 相关逻辑。
   */
  @Builder
  getMaterialBuilder() {
    if (this.isTextMaterial) {
      Text(this.text)
        .fontSize(this.fontSize)
        .fontColor(fontColors[this.selectedMaterialIndex].getResource())
        .getMaterialStyle()
    } else {
      if (this.getImageResource() !== undefined && this.getImageResource() !== null) {
        Image(this.getImageResource())
          .width(this.originWidth * this.scalePercent)
          .height(this.originHeight * this.scalePercent)
          .getMaterialStyle()
      }

    }
  }

  /**
   * getDotBuilder：执行 getDotBuilder 相关逻辑。
   */
  @Builder
  getDotBuilder(id: string, nodeType: NodeType) {
    Shape() {
      Circle({ width: 20, height: 20 })
    }
    .alignRules(
      this.getAlignRule(nodeType)
    )
    .id(id)
    .fill(Color.White)
    .gesture(PanGesture(this.panOption)
      .onActionStart((event: GestureEvent) => {
        this.onActionStart(event, nodeType);
      })
      .onActionUpdate((event: GestureEvent) => {
        this.onActionUpdate(event);
      })
      .onActionEnd(() => {
        this.onActionEnd();
      }))
  }

  /**
   * getCloseBuilder：执行 getCloseBuilder 相关逻辑。
   */
  @Builder
  getCloseBuilder(id: string, nodeType: NodeType) {
    Image($r('app.media.ic_public_close_filled'))
      .alignRules(
        this.getAlignRule(nodeType)
      )
      .width($r('app.float.size_25'))
      .height($r('app.float.size_25'))
      .id(id)
      .onClick(() => {
        this.onCancel();
      })
  }

  /**
   * getAlignRule：执行 getAlignRule 相关逻辑。
   */
  getAlignRule(nodeType: NodeType): AlignRuleOption {
    switch (nodeType) {
      case NodeType.LEFT_TOP:
        return {
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        };
      case NodeType.RIGHT_TOP:
        return {
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        };
      case NodeType.LEFT_BOTTOM:
        return {
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        };
      case NodeType.RIGHT_BOTTOM:
        return {
          right: { anchor: '__container__', align: HorizontalAlign.End },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        };
      case NodeType.CENTER_MATERIAL:
        return {
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        };
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Stack({ alignContent: Alignment.Center }) {
      // 背景
      Image(this.pixelMap)
        .objectFit(ImageFit.Contain)
        .onAreaChange(async (oldValue: Area, newValue: Area) => {
          logger.debug(TAG, `Ace: on area change, oldValue is ${JSON.stringify(oldValue)} value is ${JSON.stringify(newValue)}`);
          this.containerHeight = Number(newValue.height);
          this.containerWidth = Number(newValue.width);

          this.centerX = this.containerWidth / 2;
          this.centerY = this.containerHeight / 2;
          // 图片宽高和容器宽高，取最小值
          await this.pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            this.imageWidth = imageInfo.size.width;
            this.imageHeight = imageInfo.size.height;
            const size: Size = getContainSize(this.containerWidth, this.containerHeight, this.imageWidth, this.imageHeight)
            this.actualImageWidth = size.width;
            this.actualImageHeight = size.height;

            logger.debug(TAG, '图片的尺寸为：width=' + this.imageWidth + ',height=' + this.imageHeight);
            logger.debug(TAG, '图片实际显示的尺寸为：width=' + this.actualImageWidth + ',height=' + this.actualImageHeight);

            // 设置图片和容器宽高
            this.computeFeature.setMaterialAndImageSize(this.containerWidth, this.containerHeight, this.actualImageWidth, this.actualImageHeight);
          })
        })
      // 素材
      RelativeContainer() {
        // 边框
        Stack() {
          Stack() {
          }.width("100%")
          .height("100%")
          .border({
            width: $r('app.float.size_3'),
            color: Color.White,
          })
        }
        .width("100%")
        .height("100%")
        .padding($r('app.float.size_10'))
        .id('border')
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        // 展示素材
        this.getMaterialBuilder()
        this.getCloseBuilder('ic_close', NodeType.LEFT_TOP)
        this.getDotBuilder('right_top_dot', NodeType.RIGHT_TOP)
        this.getDotBuilder('left_bottom_dot', NodeType.LEFT_BOTTOM)
        this.getDotBuilder('right_bottom_dot', NodeType.RIGHT_BOTTOM)
      }
      .height(this.materialHeight)
      .width(this.materialWidth)
      .position(this.getPosition())
      .markAnchor(this.getMarkAnchorPosition())
    }
    .backgroundColor(Color.Black)
  }
}
