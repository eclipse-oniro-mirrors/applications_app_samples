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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { EmbedDocumentHost } from './EmbedDocumentHost';
import { paceTurn } from './shared/TestPace';

// Used border widths are quantized at fractional display densities.
const USED_STYLE_INPUTS: string =
  '  function usedInputs(node, parent) {' +
  '    const css = getComputedStyle(node), pc = getComputedStyle(parent);' +
  '    const shown = css.display !== \'none\' && pc.display !== \'none\';' +
  '    return [shown ? parseFloat(css.width) : 0, shown ? parseFloat(css.height) : 0,' +
  '      parseFloat(css.paddingLeft) + parseFloat(css.paddingRight),' +
  '      parseFloat(css.paddingTop) + parseFloat(css.paddingBottom),' +
  '      parseFloat(css.borderLeftWidth) + parseFloat(css.borderRightWidth),' +
  '      parseFloat(css.borderTopWidth) + parseFloat(css.borderBottomWidth),' +
  '      Number(css.boxSizing === \'border-box\'), Number(shown),' +
  '      parseFloat(pc.borderLeftWidth) + parseFloat(pc.borderRightWidth),' +
  '      parseFloat(pc.borderTopWidth) + parseFloat(pc.borderBottomWidth)];' +
  '  }';

function usedBoxOracle(values: number[], start: number): number[] {
  const paddingWidth: number = values[start + 2];
  const paddingHeight: number = values[start + 3];
  const borderWidth: number = values[start + 4];
  const borderHeight: number = values[start + 5];
  const borderBox: boolean = values[start + 6] === 1;
  const shown: boolean = values[start + 7] === 1;
  const width: number = shown ? (borderBox ? Math.max(values[start], paddingWidth + borderWidth) :
    values[start] + paddingWidth + borderWidth) : 0;
  const height: number = shown ? (borderBox ? Math.max(values[start + 1], paddingHeight + borderHeight) :
    values[start + 1] + paddingHeight + borderHeight) : 0;
  return [Math.round(width), Math.round(height), width, height,
    Math.round(shown ? width - borderWidth : 0), Math.round(shown ? height - borderHeight : 0)];
}

export default function embedBoxSequence02(host: EmbedDocumentHost): void {
  describe('EmbedBoxSequence02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0046
     * @tc.name testEmbedBoxSequence0046
     * @tc.desc border-box width equal fractional constraints includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:3px;height:80.75px;padding:2px 3px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-width:18.5px;max-width:18.5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'24px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'min-width\', \'0\');' +
        '    node.style.setProperty(\'max-width\', \'none\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(Math.max(18.5, Math.min(3, 18.5)), result[26] + result[28]),
        Math.max(80.75, result[27] + result[29]),
        Math.max(Math.max(18.5, Math.min(24, 18.5)), result[36] + result[38]),
        Math.max(80.75, result[37] + result[39]), Math.max(24, result[46] + result[48]),
        Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0047
     * @tc.name testEmbedBoxSequence0047
     * @tc.desc border-box width zero maximum with decoration floor includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:36px;height:80.75px;padding:2px 3px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:1px 2px;max-width:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'max-width\', \'5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'max-width\', \'none\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(Math.min(36, 0), result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(Math.min(36, 5), result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(36, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0048
     * @tc.name testEmbedBoxSequence0048
     * @tc.desc border-box width subpixel clipping around half pixel includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:16.25px;height:80.75px;padding:2px 3px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-width:16.5px;' +
        'max-width:16.75px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'16.625px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'17px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(Math.max(16.5, Math.min(16.25, 16.75)), result[26] + result[28]),
        Math.max(80.75, result[27] + result[29]),
        Math.max(Math.max(16.5, Math.min(16.625, 16.75)), result[36] + result[38]),
        Math.max(80.75, result[37] + result[39]),
        Math.max(Math.max(16.5, Math.min(17, 16.75)), result[46] + result[48]),
        Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0049
     * @tc.name testEmbedBoxSequence0049
     * @tc.desc border-box height minimum threshold includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:2px;padding:2px 3px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-height:20px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'1px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]), Math.max(Math.max(20, 2), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]), Math.max(Math.max(20, 25), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(Math.max(20, 1), result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0050
     * @tc.name testEmbedBoxSequence0050
     * @tc.desc border-box height maximum threshold includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:40px;padding:2px 3px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px;max-height:30px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'60px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]), Math.max(Math.min(40, 30), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]), Math.max(Math.min(25, 30), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(Math.min(60, 30), result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0051
     * @tc.name testEmbedBoxSequence0051
     * @tc.desc border-box height conflicting minimum and maximum includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:20px;padding:2px 3px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-height:30px;max-height:10px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'min-height\', \'5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'max-height\', \'none\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]),
        Math.max(Math.max(30, Math.min(20, 10)), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]),
        Math.max(Math.max(5, Math.min(20, 10)), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(Math.max(5, 20), result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0052
     * @tc.name testEmbedBoxSequence0052
     * @tc.desc border-box height equal fractional constraints includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:3px;padding:2px 3px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-height:18.5px;max-height:18.5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'24px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'min-height\', \'0\');' +
        '    node.style.setProperty(\'max-height\', \'none\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]),
        Math.max(Math.max(18.5, Math.min(3, 18.5)), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]),
        Math.max(Math.max(18.5, Math.min(24, 18.5)), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(24, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0053
     * @tc.name testEmbedBoxSequence0053
     * @tc.desc border-box height zero maximum with decoration floor includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:36px;padding:2px 3px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px;max-height:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'max-height\', \'5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'max-height\', \'none\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]), Math.max(Math.min(36, 0), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]), Math.max(Math.min(36, 5), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(36, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0054
     * @tc.name testEmbedBoxSequence0054
     * @tc.desc border-box height subpixel clipping around half pixel includes padding and border independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:16.25px;padding:2px 3px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px;min-height:16.5px;' +
        'max-height:16.75px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'16.625px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'17px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]),
        Math.max(Math.max(16.5, Math.min(16.25, 16.75)), result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]),
        Math.max(Math.max(16.5, Math.min(16.625, 16.75)), result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]),
        Math.max(Math.max(16.5, Math.min(17, 16.75)), result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0055
     * @tc.name testEmbedBoxSequence0055
     * @tc.desc width left-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-left:4px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'3.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'4.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(3.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(4.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0056
     * @tc.name testEmbedBoxSequence0056
     * @tc.desc width right-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-right:5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'4.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'5.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(4.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(5.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0057
     * @tc.name testEmbedBoxSequence0057
     * @tc.desc width top-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-top:6px;border-left-width:1px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'1.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(0.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(1.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0058
     * @tc.name testEmbedBoxSequence0058
     * @tc.desc width bottom-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-bottom:7px;border-left-width:1px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'1.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(0.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(1.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0059
     * @tc.name testEmbedBoxSequence0059
     * @tc.desc width horizontal border floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:0 2px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'3.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'4.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(3.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(4.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0060
     * @tc.name testEmbedBoxSequence0060
     * @tc.desc width vertical border floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:3px 0;border-left-width:1px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'1.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(0.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(1.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0061
     * @tc.name testEmbedBoxSequence0061
     * @tc.desc width fractional padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0.75px 1.25px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'2.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'3.25px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(2.25, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(3.25, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0062
     * @tc.name testEmbedBoxSequence0062
     * @tc.desc width mixed padding and border floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'5.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'6.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(5.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(6.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0063
     * @tc.name testEmbedBoxSequence0063
     * @tc.desc width four distinct side floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:1px 2px 3px 4px;border:0 ' +
        'solid transparent;box-sizing:border-box;margin:0;border-width:1px 2px 3px 4px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'11.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'12.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(0, result[26] + result[28]), Math.max(80.75, result[27] + result[29]),
        Math.max(11.75, result[36] + result[38]), Math.max(80.75, result[37] + result[39]),
        Math.max(12.75, result[46] + result[48]), Math.max(80.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0064
     * @tc.name testEmbedBoxSequence0064
     * @tc.desc height left-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-left:4px;border-top-width:1px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'1.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]), Math.max(0, result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]), Math.max(0.75, result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(1.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0065
     * @tc.name testEmbedBoxSequence0065
     * @tc.desc height right-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;padding-right:5px;border-top-width:1px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.75px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'1.75px\');' +
        '    const s3 = usedInputs(node, parent);' +
        '    const third = getEmbedSize(), r3 = node.getBoundingClientRect();' +
        '    values.push(third.width, third.height, r3.width, r3.height, node.clientWidth, node.clientHeight);' +
        '    values.push(first.width, first.height, second.width, second.height,' +
        '      Number(first !== second), Number(second !== third));' +
        '    values.push(...s1, ...s2, ...s3);' +
        '    return JSON.stringify(values);' +
        '  } finally {' +
        '    if (oldNode === null) { node.removeAttribute(\'style\'); }' +
        '    else { node.setAttribute(\'style\', oldNode); }' +
        '    if (oldParent === null) { parent.removeAttribute(\'style\'); }' +
        '    else { parent.setAttribute(\'style\', oldParent); }' +
        '  }' +
        '})()'
      )) as number[];
      const firstOracle: number[] = usedBoxOracle(result, 24);
      const secondOracle: number[] = usedBoxOracle(result, 34);
      const thirdOracle: number[] = usedBoxOracle(result, 44);
      const expected: number[] = [
        firstOracle[0], firstOracle[1], secondOracle[0], secondOracle[1], thirdOracle[0], thirdOracle[1]
      ];
      const cssExpected: number[] = [
        Math.max(120.25, result[26] + result[28]), Math.max(0, result[27] + result[29]),
        Math.max(120.25, result[36] + result[38]), Math.max(0.75, result[37] + result[39]),
        Math.max(120.25, result[46] + result[48]), Math.max(1.75, result[47] + result[49])
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 1 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 1 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 1 && result[51] === 1).assertTrue();
      expect(result.slice(0, 2).join(',')).assertEqual(expected.slice(0, 2).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual(expected.slice(2, 4).join(','));
      expect(result.slice(12, 14).join(',')).assertEqual(expected.slice(4, 6).join(','));
      expect(Math.abs(result[2] - (firstOracle[2])) < 0.03125 &&
        Math.abs(result[3] - (firstOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[8] - (secondOracle[2])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_BOX_SEQUENCE_0066
     * @tc.name testEmbedBoxSequence0066
     * @tc.desc height top-only padding floor: zero to just below floor to just above floor
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedBoxSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
