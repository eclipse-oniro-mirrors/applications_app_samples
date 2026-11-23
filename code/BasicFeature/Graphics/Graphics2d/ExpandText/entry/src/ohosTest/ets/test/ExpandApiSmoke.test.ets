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
import { text, drawing, common2D } from '@kit.ArkGraphics2D';
import { image } from '@kit.ImageKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandText]';

function createBuilder(): text.ParagraphBuilder {
  const style: text.TextStyle = {
    fontSize: 20,
    color: { alpha: 255, red: 255, green: 0, blue: 0 }
  };
  const builder: text.ParagraphBuilder = new text.ParagraphBuilder(
    { textStyle: style }, text.FontCollection.getGlobalInstance());
  builder.pushStyle(style);
  return builder;
}

export default function expandApiSmokeTest(): void {
  describe('ExpandApiSmoke', () => {
    /**
     * @tc.number EXPAND_API_0001
     * @tc.name expand_api_layout_and_paint
     * @tc.desc 真实 Paragraph 布局比较、坐标反查与 PixelMap 绘制，不估算字符宽度
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('expand_api_layout_and_paint', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expand_api_layout_and_paint begin');
      const pixelMap: image.PixelMap = image.createPixelMapSync(new ArrayBuffer(400 * 160 * 4), {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { width: 400, height: 160 }
      });
      try {
        const input: string = 'OpenHarmony text layout supports expanding and collapsing long paragraphs.';
        const builder: text.ParagraphBuilder = createBuilder();
        builder.addText(input);
        builder.popStyle();
        const paragraph: text.Paragraph = builder.build();
        paragraph.layoutSync(100);
        const narrowLines: number = paragraph.getLineCount();
        paragraph.layoutSync(400);
        const wideLines: number = paragraph.getLineCount();
        const height: number = paragraph.getHeight();
        const position: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(30, 10);
        const word: text.Range = paragraph.getWordBoundary(0);
        hilog.info(DOMAIN, TAG, '窄行数=%{public}d 宽行数=%{public}d 高=%{public}s glyph=%{public}d',
          narrowLines, wideLines, String(height), position.position);
        hilog.info(DOMAIN, TAG, 'word=%{public}s maxWidth=%{public}s',
          JSON.stringify(word), String(paragraph.getMaxWidth()));
        expect(narrowLines > wideLines && wideLines > 0).assertTrue();
        expect(height > 0 && height < 160).assertTrue();
        expect(paragraph.getMaxWidth()).assertEqual(400);
        expect(position.position >= 0 && position.position <= input.length).assertTrue();
        expect(word.start).assertEqual(0);
        expect(word.end > word.start && word.end <= input.length).assertTrue();
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        canvas.clear({ alpha: 0, red: 0, green: 0, blue: 0 });
        paragraph.paint(canvas, 0, 0);
        const buffer: ArrayBuffer = new ArrayBuffer(400 * 160 * 4);
        pixelMap.readPixelsToBufferSync(buffer);
        const bytes: Uint8Array = new Uint8Array(buffer);
        let painted: number = 0;
        for (let offset: number = 3; offset < bytes.length; offset += 4) {
          if (bytes[offset] > 0) {
            painted++;
          }
        }
        hilog.info(DOMAIN, TAG, '真实绘制非透明像素=%{public}d', painted);
        expect(painted > 0).assertTrue();
      } finally {
        try {
          await pixelMap.release();
        } finally {
          hilog.info(DOMAIN, TAG, '%{public}s', 'expand_api_layout_and_paint end');
        }
      }
    });

    /**
     * @tc.number EXPAND_API_0002
     * @tc.name expand_api_placeholder_geometry
     * @tc.desc 真实混合段落占位符及显式换行布局，校验 native 返回的矩形尺寸
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('expand_api_placeholder_geometry', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expand_api_placeholder_geometry begin');
      try {
        const builder: text.ParagraphBuilder = createBuilder();
        builder.addText('A');
        builder.addPlaceholder({
          width: 64,
          height: 24,
          align: text.PlaceholderAlignment.ABOVE_BASELINE,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 0
        });
        builder.addText('\nB');
        builder.popStyle();
        const paragraph: text.Paragraph = builder.build();
        paragraph.layoutSync(320);
        const boxes: text.TextBox[] = paragraph.getRectsForPlaceholders();
        const lines: number = paragraph.getLineCount();
        hilog.info(DOMAIN, TAG, 'placeholder=%{public}s lines=%{public}d', JSON.stringify(boxes), lines);
        expect(boxes.length).assertEqual(1);
        expect(lines).assertEqual(2);
        const rect: common2D.Rect = boxes[0].rect;
        expect(Math.abs(rect.right - rect.left - 64) < 0.01).assertTrue();
        expect(Math.abs(rect.bottom - rect.top - 24) < 0.01).assertTrue();
        expect(paragraph.getLineHeight(0) >= 24).assertTrue();
        expect(paragraph.getLineWidth(0) >= 64).assertTrue();
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s', 'expand_api_placeholder_geometry end');
      }
    });
  });
}
