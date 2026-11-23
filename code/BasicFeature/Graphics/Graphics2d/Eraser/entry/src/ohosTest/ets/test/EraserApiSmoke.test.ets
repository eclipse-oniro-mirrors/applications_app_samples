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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { drawing } from '@kit.ArkGraphics2D';
import { image } from '@kit.ImageKit';
import { DrawContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MyRenderNode, MyImageRenderNode } from
  'erasercomponent/src/main/ets/model/RenderNodeModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Eraser]';

function createTarget(): image.PixelMap {
  return image.createPixelMapSync(new ArrayBuffer(64 * 64 * 4), {
    editable: true,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    size: { width: 64, height: 64 }
  });
}

function pixelAtCenter(pixelMap: image.PixelMap): number[] {
  const buffer: ArrayBuffer = new ArrayBuffer(64 * 64 * 4);
  pixelMap.readPixelsToBufferSync(buffer);
  const pixels: Uint8Array = new Uint8Array(buffer);
  const offset: number = (32 * 64 + 32) * 4;
  return [pixels[offset], pixels[offset + 1], pixels[offset + 2], pixels[offset + 3]];
}

function contextFor(canvas: drawing.Canvas): DrawContext {
  // 仅适配绘制目标；业务 draw 调用的 Canvas 和 PixelMap 都是真实系统对象。
  return { canvas: canvas, size: { width: 64, height: 64 }, sizeInPixel: { width: 64, height: 64 } };
}

export default function eraserApiSmokeTest(): void {
  describe('EraserApiSmoke', () => {
    /**
     * @tc.number ERASER_API_0001
     * @tc.name eraser_api_draw_and_clear
     * @tc.desc 调用业务 MyRenderNode.draw 验证真实像素涂鸦与 CLEAR 擦除
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('eraser_api_draw_and_clear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraser_api_draw_and_clear begin');
      let pixelMap: image.PixelMap | undefined = undefined;
      let canvas: drawing.Canvas | undefined = undefined;
      let node: MyRenderNode | undefined = undefined;
      try {
        pixelMap = createTarget();
        canvas = new drawing.Canvas(pixelMap);
        node = new MyRenderNode();
        canvas.clear({ alpha: 0, red: 0, green: 0, blue: 0 });
        node.path.moveTo(8, 32);
        node.path.lineTo(56, 32);
        node.lineStrokeWidth = 16;
        node.draw(contextFor(canvas));
        const drawn: number[] = pixelAtCenter(pixelMap);
        hilog.info(DOMAIN, TAG, '涂鸦中心 RGBA=%{public}s', JSON.stringify(drawn));
        expect(drawn[0]).assertEqual(250);
        expect(drawn[1]).assertEqual(100);
        expect(drawn[2]).assertEqual(0);
        expect(drawn[3]).assertEqual(255);
        node.blendMode = drawing.BlendMode.CLEAR;
        node.draw(contextFor(canvas));
        const erased: number[] = pixelAtCenter(pixelMap);
        hilog.info(DOMAIN, TAG, '擦除中心 RGBA=%{public}s', JSON.stringify(erased));
        expect(erased[3]).assertEqual(0);
      } finally {
        try {
          canvas?.detachPen();
        } finally {
          try {
            node?.dispose();
          } finally {
            try {
              await pixelMap?.release();
            } finally {
              hilog.info(DOMAIN, TAG, '%{public}s', 'eraser_api_draw_and_clear end');
            }
          }
        }
      }
    });

    /**
     * @tc.number ERASER_API_0002
     * @tc.name eraser_api_history_redraw
     * @tc.desc 调用业务 MyImageRenderNode.draw 验证栈顶重绘及撤销后的真实像素
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('eraser_api_history_redraw', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraser_api_history_redraw begin');
      let target: image.PixelMap | undefined = undefined;
      let first: image.PixelMap | undefined = undefined;
      let last: image.PixelMap | undefined = undefined;
      let node: MyImageRenderNode | undefined = undefined;
      try {
        target = createTarget();
        first = createTarget();
        last = createTarget();
        const canvas: drawing.Canvas = new drawing.Canvas(target);
        node = new MyImageRenderNode();
        new drawing.Canvas(first).clear({ alpha: 255, red: 255, green: 0, blue: 0 });
        new drawing.Canvas(last).clear({ alpha: 255, red: 0, green: 0, blue: 255 });
        node.pixelMapHistory.push(first, last);
        node.draw(contextFor(canvas));
        const latest: number[] = pixelAtCenter(target);
        hilog.info(DOMAIN, TAG, '栈顶 RGBA=%{public}s', JSON.stringify(latest));
        expect(latest[0]).assertEqual(0);
        expect(latest[2]).assertEqual(255);
        expect(latest[3]).assertEqual(255);
        node.pixelMapHistory.pop();
        node.draw(contextFor(canvas));
        const restored: number[] = pixelAtCenter(target);
        hilog.info(DOMAIN, TAG, '撤销后 RGBA=%{public}s', JSON.stringify(restored));
        expect(restored[0]).assertEqual(255);
        expect(restored[2]).assertEqual(0);
        expect(restored[3]).assertEqual(255);
      } finally {
        try {
          if (node !== undefined) {
            node.pixelMapHistory = [];
            node.dispose();
          }
        } finally {
          try {
            await last?.release();
          } finally {
            try {
              await first?.release();
            } finally {
              try {
                await target?.release();
              } finally {
                hilog.info(DOMAIN, TAG, '%{public}s', 'eraser_api_history_redraw end');
              }
            }
          }
        }
      }
    });
  });
}
