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
  buttonRes: Resource;
  titleRes: Resource;
  draw: (ctx: CanvasRenderer, w: number, h: number) => void;
}

export class SceneRegistry {
  private static readonly scenes: SceneInfo[] = [
    {
      id: 1,
      button: 'Scene 1: Linear gradient and gradient stroke',
      buttonRes: $r('app.string.scene_1_button'),
      title: 'Scene 1: Linear gradient and gradient stroke',
      titleRes: $r('app.string.scene_1_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawLinearGradient(ctx, w, h);
      }
    },
    {
      id: 2,
      button: 'Scene 1: Radial gradient glow',
      buttonRes: $r('app.string.scene_2_button'),
      title: 'Scene 1: Radial gradient glow',
      titleRes: $r('app.string.scene_2_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawRadialGradient(ctx, w, h);
      }
    },
    {
      id: 3,
      button: 'Scene 2: Pattern fill repeat',
      buttonRes: $r('app.string.scene_3_button'),
      title: 'Scene 2: Pattern fill repeat',
      titleRes: $r('app.string.scene_3_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const pm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(66, 165, 245, 255));
        PixelMapUtil.useBitmap(pm, (bitmap: ImageBitmap): void => {
          CanvasScenes.drawPatternFill(ctx, 0, 0, w, h, bitmap, 'repeat');
        });
      }
    },
    {
      id: 4,
      button: 'Scene 2: repeat-x and no-repeat',
      buttonRes: $r('app.string.scene_4_button'),
      title: 'Scene 2: repeat-x and no-repeat',
      titleRes: $r('app.string.scene_4_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const stripePm = PixelMapUtil.createStripes(32, 8,
          PixelMapUtil.rgba(255, 238, 88, 255), PixelMapUtil.rgba(239, 83, 80, 255));
        const checkerPm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(66, 165, 245, 255));
        PixelMapUtil.useBitmap(stripePm, (bitmap: ImageBitmap): void => {
          CanvasScenes.drawPatternFill(ctx, 0, 0, w, h / 2, bitmap, 'repeat-x');
        });
        PixelMapUtil.useBitmap(checkerPm, (bitmap: ImageBitmap): void => {
          CanvasScenes.drawPatternFill(ctx, w / 4, h / 2 + 20, w / 2, h / 2 - 40, bitmap, 'no-repeat');
        });
      }
    },
    {
      id: 5,
      button: 'Scene 3: Matrix2D translate',
      buttonRes: $r('app.string.scene_5_button'),
      title: 'Scene 3: Matrix2D translate',
      titleRes: $r('app.string.scene_5_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixTranslate(ctx, w, h);
      }
    },
    {
      id: 6,
      button: 'Scene 3: Matrix2D scale',
      buttonRes: $r('app.string.scene_6_button'),
      title: 'Scene 3: Matrix2D scale',
      titleRes: $r('app.string.scene_6_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixScale(ctx, w, h);
      }
    },
    {
      id: 7,
      button: 'Scene 3: Matrix2D rotate',
      buttonRes: $r('app.string.scene_7_button'),
      title: 'Scene 3: Matrix2D rotate',
      titleRes: $r('app.string.scene_7_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixRotate(ctx, w, h);
      }
    },
    {
      id: 8,
      button: 'Scene 3: Combined transforms and inverse matrix',
      buttonRes: $r('app.string.scene_8_button'),
      title: 'Scene 3: Combined transforms and inverse matrix',
      titleRes: $r('app.string.scene_8_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixCombined(ctx, w, h);
      }
    },
    {
      id: 9,
      button: 'Scene 4: Offscreen composite (three features chained)',
      buttonRes: $r('app.string.scene_9_button'),
      title: 'Scene 4: Offscreen composite (three features chained)',
      titleRes: $r('app.string.scene_9_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const dotPm = PixelMapUtil.createDots(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(38, 50, 56, 255));
        PixelMapUtil.useBitmap(dotPm, (bitmap: ImageBitmap): void => {
          CanvasScenes.runCompositeScene(ctx, w, h, bitmap);
        });
      }
    },
    {
      id: 10,
      button: 'Scene 3: Matrix2D skew (property style)',
      buttonRes: $r('app.string.scene_10_button'),
      title: 'Scene 3: Matrix2D skew (property style)',
      titleRes: $r('app.string.scene_10_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawMatrixSkew(ctx, w, h);
      }
    },
    {
      id: 11,
      button: 'Extension: ImageData pixel operations',
      buttonRes: $r('app.string.scene_11_button'),
      title: 'Extension: ImageData pixel operations',
      titleRes: $r('app.string.scene_11_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawImageData(ctx, w, h);
      }
    },
    {
      id: 12,
      button: 'Extension: GeometryUtil dot ring',
      buttonRes: $r('app.string.scene_12_button'),
      title: 'Extension: GeometryUtil dot ring',
      titleRes: $r('app.string.scene_12_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawDotRing(ctx, w, h);
      }
    },
    {
      id: 13,
      button: 'Supplement: Pattern matrix transform (Pattern x Matrix2D)',
      buttonRes: $r('app.string.scene_13_button'),
      title: 'Supplement: CanvasPattern.setTransform pattern matrix',
      titleRes: $r('app.string.scene_13_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        const pm = PixelMapUtil.createCheckerboard(32, 8,
          PixelMapUtil.rgba(255, 255, 255, 255), PixelMapUtil.rgba(156, 39, 176, 255));
        PixelMapUtil.useBitmap(pm, (bitmap: ImageBitmap): void => {
          CanvasScenes.drawPatternTransform(ctx, w, h, bitmap);
        });
      }
    },
    {
      id: 14,
      button: 'Supplement: drawImage source rectangle crop',
      buttonRes: $r('app.string.scene_14_button'),
      title: 'Supplement: drawImage 9-arg source rectangle crop',
      titleRes: $r('app.string.scene_14_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawImageCrop(ctx, w, h);
      }
    },
    {
      id: 15,
      button: 'Supplement: Shadow + gradient',
      buttonRes: $r('app.string.scene_15_button'),
      title: 'Supplement: Shadow and gradient overlay',
      titleRes: $r('app.string.scene_15_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawShadowGradient(ctx, w, h);
      }
    },
    {
      id: 16,
      button: 'Supplement: filter blur comparison',
      buttonRes: $r('app.string.scene_16_button'),
      title: 'Supplement: filter blur comparison',
      titleRes: $r('app.string.scene_16_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawFilterBlur(ctx, w, h);
      }
    },
    {
      id: 17,
      button: 'Supplement: ColorMetrics gradient stops (API 12+)',
      buttonRes: $r('app.string.scene_17_button'),
      title: 'Supplement: addColorStop ColorMetrics overload',
      titleRes: $r('app.string.scene_17_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawColorMetricsGradient(ctx, w, h);
      }
    },
    {
      id: 18,
      button: 'Scene 1: Conic gradient color wheel (API 12+)',
      buttonRes: $r('app.string.scene_18_button'),
      title: 'Scene 1: createConicGradient conic color wheel',
      titleRes: $r('app.string.scene_18_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawConicGradient(ctx, w, h);
      }
    },
    {
      id: 19,
      button: 'Extension: Bezier and quadratic curve paths',
      buttonRes: $r('app.string.scene_19_button'),
      title: 'Extension: Path drawing (bezierCurveTo / quadraticCurveTo / arcTo)',
      titleRes: $r('app.string.scene_19_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawPathCurves(ctx, w, h);
      }
    },
    {
      id: 20,
      button: 'Extension: clip and composite modes',
      buttonRes: $r('app.string.scene_20_button'),
      title: 'Extension: clip + globalCompositeOperation composite modes',
      titleRes: $r('app.string.scene_20_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawClipComposite(ctx, w, h);
      }
    },
    {
      id: 21,
      button: 'Extension: Text drawing and measureText',
      buttonRes: $r('app.string.scene_21_button'),
      title: 'Extension: fillText / strokeText / measureText text drawing',
      titleRes: $r('app.string.scene_21_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawTextStyles(ctx, w, h);
      }
    },
    {
      id: 22,
      button: 'Extension: Dashed stroke and line caps/joins',
      buttonRes: $r('app.string.scene_22_button'),
      title: 'Extension: setLineDash / lineCap / lineJoin stroke styles',
      titleRes: $r('app.string.scene_22_title'),
      draw: (ctx: CanvasRenderer, w: number, h: number): void => {
        CanvasScenes.drawLineDash(ctx, w, h);
      }
    },
    {
      id: 23,
      button: 'Extension: ImageData readback invert',
      buttonRes: $r('app.string.scene_23_button'),
      title: 'Extension: getImageData readback and pixel inversion',
      titleRes: $r('app.string.scene_23_title'),
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
