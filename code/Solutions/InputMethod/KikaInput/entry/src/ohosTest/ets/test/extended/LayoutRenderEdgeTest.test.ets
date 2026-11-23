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
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import {
  KeyState,
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputLayoutRenderEdge]';

function render(state: number, lower: string, upper: string): string {
  if (state === KeyState.LOWER_CASE) {
    return lower;
  }
  return upper;
}

export default function LayoutRenderEdgeTestTest(): void {
  describe('LayoutRenderEdgeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0100
     * @tc.name      testLayoutRenderEdge_001
     * @tc.desc      Verify a five-state matrix over one key yields the expected glyph sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_001 begin');
      const states: number[] = [0, 1, 2, 3, -1];
      const glyphs: string[] = [];
      let i: number = 0;
      while (i < states.length) {
        glyphs.push(render(states[i], 'a', 'A'));
        i = i + 1;
      }
      expect(glyphs.join('')).assertEqual('aAAAA');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0200
     * @tc.name      testLayoutRenderEdge_002
     * @tc.desc      Verify a negative state and a large state both select the secondary glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_002 begin');
      const secondary: boolean = render(-99, 'x', 'X') === 'X' && render(999, 'x', 'X') === 'X';
      expect(secondary).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0300
     * @tc.name      testLayoutRenderEdge_003
     * @tc.desc      Verify empty lower and upper strings survive both render branches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_003 begin');
      const lower: string = render(KeyState.LOWER_CASE, '', '');
      const upper: string = render(KeyState.UPPER_CASE, '', '');
      const rebuilt: string = lower + '|' + upper;
      expect(rebuilt).assertEqual('|');
      expect(rebuilt.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0400
     * @tc.name      testLayoutRenderEdge_004
     * @tc.desc      Verify a CJK glyph passes through both states unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_004 begin');
      const cjk: string = '中';
      const pair: string[] = [render(KeyState.LOWER_CASE, cjk, cjk), render(KeyState.UPPER_CASE, cjk, cjk)];
      expect(pair[0].charCodeAt(0)).assertEqual(20013);
      expect(pair.join('')).assertEqual('中中');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0500
     * @tc.name      testLayoutRenderEdge_005
     * @tc.desc      Verify numeric state values map to lower and secondary glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_005 begin');
      const results: Map<number, string> = new Map<number, string>();
      for (let state = 0; state <= 2; state++) {
        results.set(state, render(state, 'k', 'K'));
      }
      expect(results.get(0)).assertEqual('k');
      expect(results.get(1)).assertEqual('K');
      expect(results.get(2)).assertEqual('K');
      expect(results.size).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0600
     * @tc.name      testLayoutRenderEdge_006
     * @tc.desc      Verify every upper render equals the alphabetical upper form of its content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_006 begin');
      let mismatches: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        if (render(KeyState.UPPER_CASE, item.content, item.upperContent) !== item.content.toUpperCase()) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0700
     * @tc.name      testLayoutRenderEdge_007
     * @tc.desc      Verify every lower render equals the stored content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_007 begin');
      const expected: string[] = [];
      const actual: string[] = [];
      let i: number = 0;
      while (i < keySourceListData.length) {
        expected.push(keySourceListData[i].content);
        actual.push(render(KeyState.LOWER_CASE,
            keySourceListData[i].content, keySourceListData[i].upperContent));
        i = i + 1;
      }
      expect(actual.join('')).assertEqual(expected.join(''));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0800
     * @tc.name      testLayoutRenderEdge_008
     * @tc.desc      Verify rendering does not change the three table lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_008 begin');
      const before: number[] = [keySourceListData.length, numberSourceListData.length,
        symbolSourceListData.length];
      for (let i = 0; i < keySourceListData.length; i++) {
        render(KeyState.UPPER_CASE, keySourceListData[i].content, keySourceListData[i].upperContent);
      }
      const after: number[] = [keySourceListData.length, numberSourceListData.length,
        symbolSourceListData.length];
      expect(after.join('|')).assertEqual(before.join('|'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_0900
     * @tc.name      testLayoutRenderEdge_009
     * @tc.desc      Verify two render passes over a sample key produce the same string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_009 begin');
      const sample: keySourceListType = keySourceListData[12];
      const first: string = render(KeyState.ONCE_UPPER_CASE, sample.content, sample.upperContent);
      const second: string = render(KeyState.ONCE_UPPER_CASE, sample.content, sample.upperContent);
      expect(second).assertEqual(first);
      expect(first).assertEqual(sample.upperContent);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_RENDER_EDGE_1000
     * @tc.name      testLayoutRenderEdge_010
     * @tc.desc      Verify number and symbol pages are stable when rendered with identical lower and upper.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdge_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_010 begin');
      let unstable: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        if (render(KeyState.LOWER_CASE, glyph, glyph) !== render(KeyState.UPPER_CASE, glyph, glyph)) {
          unstable = unstable + 1;
        }
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        if (render(KeyState.LOWER_CASE, glyph, glyph) !== render(KeyState.UPPER_CASE, glyph, glyph)) {
          unstable = unstable + 1;
        }
      }
      expect(unstable).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdge_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0100
     * @tc.name      testLayoutRenderEdgeExtra_001
     * @tc.desc      Verify both numeric render states rebuild the number page string exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_001 begin');
      let below: string = '';
      let above: string = '';
      let i: number = 0;
      while (i < numberSourceListData.length) {
        const glyph: string = numberSourceListData[i].content;
        below = below + render(KeyState.LOWER_CASE, glyph, glyph);
        above = above + render(KeyState.UPPER_CASE, glyph, glyph);
        i = i + 1;
      }
      expect(below.charAt(0)).assertEqual('1');
      expect(below.charAt(26)).assertEqual('?');
      expect(above).assertEqual(below);
      expect(below.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0200
     * @tc.name      testLayoutRenderEdgeExtra_002
     * @tc.desc      Verify both symbol render states rebuild the symbol page string exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_002 begin');
      let plain: string = '';
      let shifted: string = '';
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        plain = plain + render(KeyState.LOWER_CASE, glyph, glyph);
        shifted = shifted + render(KeyState.ONCE_UPPER_CASE, glyph, glyph);
      }
      expect(plain.charAt(26)).assertEqual(']');
      expect(shifted).assertEqual(plain);
      expect(plain.length).assertEqual(27);
      expect(plain.charAt(25)).assertEqual('[');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0300
     * @tc.name      testLayoutRenderEdgeExtra_003
     * @tc.desc      Verify the two uppercase states agree on every alphabet entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_003 begin');
      let disagreements: number = 0;
      let i: number = 0;
      while (i < keySourceListData.length) {
        const sample: keySourceListType = keySourceListData[i];
        const once: string = render(KeyState.ONCE_UPPER_CASE, sample.content, sample.upperContent);
        const held: string = render(KeyState.UPPER_CASE, sample.content, sample.upperContent);
        if (once !== held) {
          disagreements = disagreements + 1;
        }
        i = i + 1;
      }
      expect(disagreements).assertEqual(0);
      expect(keySourceListData.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0400
     * @tc.name      testLayoutRenderEdgeExtra_004
     * @tc.desc      Verify every state above the enum range selects the secondary glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_004 begin');
      let lowerHits: number = 0;
      for (let state = 3; state <= 10; state++) {
        if (render(state, 'g', 'G') === 'g') {
          lowerHits = lowerHits + 1;
        }
      }
      expect(render(3, 'g', 'G')).assertEqual('G');
      expect(render(10, 'g', 'G')).assertEqual('G');
      expect(lowerHits).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0500
     * @tc.name      testLayoutRenderEdgeExtra_005
     * @tc.desc      Verify all ten negative states select the secondary glyph as well.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_005 begin');
      let mismatched: number = 0;
      for (let state = -1; state >= -10; state--) {
        if (render(state, 'h', 'H') !== 'H') {
          mismatched = mismatched + 1;
        }
      }
      expect(mismatched).assertEqual(0);
      expect(render(-1, 'h', 'H')).assertEqual(render(-10, 'h', 'H'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0600
     * @tc.name      testLayoutRenderEdgeExtra_006
     * @tc.desc      Verify identical lower and upper inputs stay stable across all three states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_006 begin');
      const states: number[] = [KeyState.LOWER_CASE, KeyState.ONCE_UPPER_CASE, KeyState.UPPER_CASE];
      const glyphs: string[] = ['x', '∆', '7'];
      let unstable: number = 0;
      for (let g = 0; g < glyphs.length; g++) {
        for (let s = 0; s < states.length; s++) {
          if (render(states[s], glyphs[g], glyphs[g]) !== glyphs[g]) {
            unstable = unstable + 1;
          }
        }
      }
      expect(glyphs.length * states.length).assertEqual(9);
      expect(unstable).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0700
     * @tc.name      testLayoutRenderEdgeExtra_007
     * @tc.desc      Verify empty lower and upper strings render empty in every state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_007 begin');
      const states: number[] = [KeyState.LOWER_CASE, KeyState.ONCE_UPPER_CASE, KeyState.UPPER_CASE, -1, 5];
      let nonEmpty: number = 0;
      let i: number = 0;
      while (i < states.length) {
        if (render(states[i], '', '').length !== 0) {
          nonEmpty = nonEmpty + 1;
        }
        i = i + 1;
      }
      expect(nonEmpty).assertEqual(0);
      expect(render(KeyState.UPPER_CASE, '', '').length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0800
     * @tc.name      testLayoutRenderEdgeExtra_008
     * @tc.desc      Verify a CJK glyph renders identically across five different states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_008 begin');
      const states: number[] = [-5, 0, 1, 2, 9];
      const outputs: string[] = [];
      for (let i = 0; i < states.length; i++) {
        outputs.push(render(states[i], '键', '键'));
      }
      expect(outputs[0].charCodeAt(0)).assertEqual(38190);
      expect(outputs.join('')).assertEqual('键键键键键');
      expect(outputs[0]).assertEqual(outputs[4]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_0900
     * @tc.name      testLayoutRenderEdgeExtra_009
     * @tc.desc      Verify the uppercase column rebuilds the complete uppercase alphabet string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_009 begin');
      let upper: string = '';
      let i: number = 0;
      while (i < keySourceListData.length) {
        upper = upper + render(KeyState.UPPER_CASE,
            keySourceListData[i].content, keySourceListData[i].upperContent);
        i = i + 1;
      }
      expect(upper.charAt(0)).assertEqual('Q');
      expect(upper.charAt(25)).assertEqual('M');
      expect(upper).assertEqual('QWERTYUIOPASDFGHJKLZXCVBNM');
      expect(upper.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_1000
     * @tc.name      testLayoutRenderEdgeExtra_010
     * @tc.desc      Verify five consecutive uppercase passes over the alphabet stay identical.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_010 begin');
      const passes: string[] = [];
      for (let p = 0; p < 5; p++) {
        let text: string = '';
        for (let i = 0; i < keySourceListData.length; i++) {
          text = text + render(KeyState.UPPER_CASE,
            keySourceListData[i].content, keySourceListData[i].upperContent);
        }
        passes.push(text);
      }
      expect(passes[2]).assertEqual(passes[1]);
      expect(passes[0].length).assertEqual(26);
      expect(passes[0]).assertEqual(passes[4]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_1100
     * @tc.name      testLayoutRenderEdgeExtra_011
     * @tc.desc      Verify a negative state matches state two for every alphabet entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_011 begin');
      let mismatched: number = 0;
      let i: number = 0;
      while (i < keySourceListData.length) {
        const sample: keySourceListType = keySourceListData[i];
        if (render(-1, sample.content, sample.upperContent) !==
            render(KeyState.UPPER_CASE, sample.content, sample.upperContent)) {
            mismatched = mismatched + 1;
          }
        i = i + 1;
      }
      expect(mismatched).assertEqual(0);
      expect(render(-1, 'q', 'Q')).assertEqual(render(KeyState.UPPER_CASE, 'q', 'Q'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_EXTRA_1200
     * @tc.name      testLayoutRenderEdgeExtra_012
     * @tc.desc      Verify the corner alphabet glyphs render with codes Q seventy-three and M seventy-seven.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutRenderEdgeExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_012 begin');
      const first: string = render(KeyState.UPPER_CASE,
        keySourceListData[0].content, keySourceListData[0].upperContent);
      const last: string = render(KeyState.UPPER_CASE,
        keySourceListData[25].content, keySourceListData[25].upperContent);
      expect(last.charCodeAt(0)).assertEqual(77);
      expect(first.charCodeAt(0) - last.charCodeAt(0)).assertEqual(4);
      expect(first === last).assertEqual(false);
      expect(first.charCodeAt(0)).assertEqual(81);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutRenderEdgeExtra_012 end');
      await yieldToEventLoop();
    });

  });
}
