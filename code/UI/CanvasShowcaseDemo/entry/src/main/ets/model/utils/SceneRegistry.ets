/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { CanvasScenes } from '../CanvasScenes';
import { PixelMapUtil } from './PixelMapUtil';

export interface SceneInfo {
  id: number;
  button: string;
  title: string;
  draw: (ctx: CanvasRenderer, w: number, h: number) => void;
}

export class SceneRegistry {
  private static readonly scenes: SceneInfo[] = [
    {
      id: 1,
      button: '场景1：线性渐变与渐变描边',
      title: '场景1：线性渐变与渐变描边',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawLinearGradient(ctx, w, h);
      }
    },
    {
      id: 2,
      button: '场景1：径向渐变光晕',
      title: '场景1：径向渐变光晕',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawRadialGradient(ctx, w, h);
      }
    },
    {
      id: 3,
      button: '场景2：图案填充 repeat',
      title: '场景2：图案填充 repeat',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const pm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(66, 165, 245, 255));
        CanvasScenes.drawPatternFill(ctx, 0, 0, w, h, new ImageBitmap(pm), 'repeat');
      }
    },
    {
      id: 4,
      button: '场景2：repeat-x 与 no-repeat',
      title: '场景2：repeat-x 与 no-repeat',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const stripePm = PixelMapUtil.createStripes(32, 8,
          PixelMapUtil.rgba(255, 238, 88, 255), PixelMapUtil.rgba(239, 83, 80, 255));
        const checkerPm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(66, 165, 245, 255));
        CanvasScenes.drawPatternFill(ctx, 0, 0, w, h / 2, new ImageBitmap(stripePm), 'repeat-x');
        CanvasScenes.drawPatternFill(ctx, w / 4, h / 2 + 20, w / 2, h / 2 - 40, new ImageBitmap(checkerPm), 'no-repeat');
      }
    },
    {
      id: 5,
      button: '场景3：Matrix2D 平移',
      title: '场景3：Matrix2D 平移',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixTranslate(ctx, w, h);
      }
    },
    {
      id: 6,
      button: '场景3：Matrix2D 缩放',
      title: '场景3：Matrix2D 缩放',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixScale(ctx, w, h);
      }
    },
    {
      id: 7,
      button: '场景3：Matrix2D 旋转',
      title: '场景3：Matrix2D 旋转',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixRotate(ctx, w, h);
      }
    },
    {
      id: 8,
      button: '场景3：组合变换与逆矩阵',
      title: '场景3：组合变换与逆矩阵',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixCombined(ctx, w, h);
      }
    },
    {
      id: 9,
      button: '场景4：离屏合成（三特性串联）',
      title: '场景4：离屏合成（三特性串联）',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const dotPm = PixelMapUtil.createDots(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(38, 50, 56, 255));
        CanvasScenes.runCompositeScene(ctx, w, h, new ImageBitmap(dotPm));
      }
    },
    {
      id: 10,
      button: '场景3：Matrix2D 倾斜（属性方式）',
      title: '场景3：Matrix2D 倾斜（属性方式）',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixSkew(ctx, w, h);
      }
    },
    {
      id: 11,
      button: '扩展：ImageData 像素操作',
      title: '扩展：ImageData 像素操作',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawImageData(ctx, w, h);
      }
    },
    {
      id: 12,
      button: '扩展：GeometryUtil 圆环阵',
      title: '扩展：GeometryUtil 圆环阵',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawDotRing(ctx, w, h);
      }
    },
    {
      id: 13,
      button: '补充：图案矩阵变换（Pattern×Matrix2D）',
      title: '补充：CanvasPattern.setTransform 图案矩阵变换',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const pm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(156, 39, 176, 255));
        CanvasScenes.drawPatternTransform(ctx, w, h, new ImageBitmap(pm));
      }
    },
    {
      id: 14,
      button: '补充：drawImage 源矩形裁剪',
      title: '补充：drawImage 9 参数源矩形裁剪',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawImageCrop(ctx, w, h);
      }
    },
    {
      id: 15,
      button: '补充：阴影 + 渐变',
      title: '补充：阴影与渐变叠加',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawShadowGradient(ctx, w, h);
      }
    },
    {
      id: 16,
      button: '补充：filter 滤镜模糊对比',
      title: '补充：filter 滤镜模糊对比',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawFilterBlur(ctx, w, h);
      }
    },
    {
      id: 17,
      button: '补充：ColorMetrics 渐变断点（API 12+）',
      title: '补充：addColorStop 的 ColorMetrics 重载',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawColorMetricsGradient(ctx, w, h);
      }
    },
    {
      id: 18,
      button: '场景1：圆锥渐变色环（API 12+）',
      title: '场景1：createConicGradient 圆锥渐变色环',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawConicGradient(ctx, w, h);
      }
    },
    {
      id: 19,
      button: '扩展：贝塞尔与二次曲线路径',
      title: '扩展：Path 绘制（bezierCurveTo / quadraticCurveTo / arcTo）',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawPathCurves(ctx, w, h);
      }
    },
    {
      id: 20,
      button: '扩展：clip 裁剪与合成模式',
      title: '扩展：clip 裁剪 + globalCompositeOperation 合成模式',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawClipComposite(ctx, w, h);
      }
    },
    {
      id: 21,
      button: '扩展：文字绘制与 measureText',
      title: '扩展：fillText / strokeText / measureText 文字绘制',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawTextStyles(ctx, w, h);
      }
    },
    {
      id: 22,
      button: '扩展：虚线描边与线帽拐角',
      title: '扩展：setLineDash / lineCap / lineJoin 描边样式',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawLineDash(ctx, w, h);
      }
    },
    {
      id: 23,
      button: '扩展：ImageData 回读反相',
      title: '扩展：getImageData 回读与像素反相',
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawImageDataReadback(ctx, w, h);
      }
    }
  ];

  /** 全部场景（Index 按此数据驱动生成按钮） */
  static getAll(): SceneInfo[] {
    return SceneRegistry.scenes;
  }

  /** 按 id 查找场景，未命中返回 null */
  static getById(id: number): SceneInfo | null {
    for (const s of SceneRegistry.scenes) {
      if (s.id === id) {
        return s;
      }
    }
    return null;
  }

  /** 场景总数 */
  static count(): number {
    return SceneRegistry.scenes.length;
  }
}
