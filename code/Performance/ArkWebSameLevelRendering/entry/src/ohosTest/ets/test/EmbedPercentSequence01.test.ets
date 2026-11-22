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

export default function embedPercentSequence01(host: EmbedDocumentHost): void {
  describe('EmbedPercentSequence01', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0001
     * @tc.name testEmbedPercentSequence0001
     * @tc.desc 0% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0%;height:0%;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        0, 0, 0, 0, 0, 0
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0002
     * @tc.name testEmbedPercentSequence0002
     * @tc.desc 12.5% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:12.5%;height:12.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        25.125, 15.125, 32.125, 15.125, 32.125, 21.625
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0003
     * @tc.name testEmbedPercentSequence0003
     * @tc.desc 25% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:25%;height:25%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        50.25, 30.25, 64.25, 30.25, 64.25, 43.25
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0004
     * @tc.name testEmbedPercentSequence0004
     * @tc.desc 37.5% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:37.5%;height:37.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        75.375, 45.375, 96.375, 45.375, 96.375, 64.875
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0005
     * @tc.name testEmbedPercentSequence0005
     * @tc.desc 50% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:50%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        100.5, 60.5, 128.5, 60.5, 128.5, 86.5
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0006
     * @tc.name testEmbedPercentSequence0006
     * @tc.desc 62.5% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:62.5%;height:62.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        125.625, 75.625, 160.625, 75.625, 160.625, 108.125
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0007
     * @tc.name testEmbedPercentSequence0007
     * @tc.desc 75% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        150.75, 90.75, 192.75, 90.75, 192.75, 129.75
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0008
     * @tc.name testEmbedPercentSequence0008
     * @tc.desc 100% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:100%;height:100%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        201, 121, 257, 121, 257, 173
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0009
     * @tc.name testEmbedPercentSequence0009
     * @tc.desc 125% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:125%;height:125%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        251.25, 151.25, 321.25, 151.25, 321.25, 216.25
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0010
     * @tc.name testEmbedPercentSequence0010
     * @tc.desc 150% both axes with width-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:150%;height:150%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
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
        301.5, 181.5, 385.5, 181.5, 385.5, 259.5
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0011
     * @tc.name testEmbedPercentSequence0011
     * @tc.desc 0% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0%;height:0%;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        0, 0, 0, 0, 0, 0
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0012
     * @tc.name testEmbedPercentSequence0012
     * @tc.desc 12.5% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:12.5%;height:12.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        25.125, 15.125, 25.125, 21.625, 32.125, 21.625
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0013
     * @tc.name testEmbedPercentSequence0013
     * @tc.desc 25% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:25%;height:25%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        50.25, 30.25, 50.25, 43.25, 64.25, 43.25
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0014
     * @tc.name testEmbedPercentSequence0014
     * @tc.desc 37.5% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:37.5%;height:37.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        75.375, 45.375, 75.375, 64.875, 96.375, 64.875
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0015
     * @tc.name testEmbedPercentSequence0015
     * @tc.desc 50% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:50%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        100.5, 60.5, 100.5, 86.5, 128.5, 86.5
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0016
     * @tc.name testEmbedPercentSequence0016
     * @tc.desc 62.5% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:62.5%;height:62.5%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        125.625, 75.625, 125.625, 108.125, 160.625, 108.125
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0017
     * @tc.name testEmbedPercentSequence0017
     * @tc.desc 75% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        150.75, 90.75, 150.75, 129.75, 192.75, 129.75
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0018
     * @tc.name testEmbedPercentSequence0018
     * @tc.desc 100% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:100%;height:100%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        201, 121, 201, 173, 257, 173
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0019
     * @tc.name testEmbedPercentSequence0019
     * @tc.desc 125% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:125%;height:125%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        251.25, 151.25, 251.25, 216.25, 321.25, 216.25
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0020
     * @tc.name testEmbedPercentSequence0020
     * @tc.desc 150% both axes with height-first parent changes; untouched axis stays fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:201px;height:121px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:150%;height:150%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'173px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'257px\');' +
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
        301.5, 181.5, 301.5, 259.5, 385.5, 259.5
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0021
     * @tc.name testEmbedPercentSequence0021
     * @tc.desc content-box percentages over content-box parent with horizontal padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0 7.25px;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        120, 120, 160, 120, 160, 180
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0022
     * @tc.name testEmbedPercentSequence0022
     * @tc.desc content-box percentages over content-box parent with vertical padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:4.75px 0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        120, 120, 160, 120, 160, 180
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0023
     * @tc.name testEmbedPercentSequence0023
     * @tc.desc content-box percentages over content-box parent with unequal borders
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;border-width:2px 3px 4px 5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        120, 120, 160, 120, 160, 180
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0024
     * @tc.name testEmbedPercentSequence0024
     * @tc.desc content-box percentages over content-box parent with mixed fractional padding and border
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:1.25px 2.75px;border:2px ' +
        'solid transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        120, 120, 160, 120, 160, 180
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0025
     * @tc.name testEmbedPercentSequence0025
     * @tc.desc border-box percentages over content-box parent with horizontal padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0 7.25px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        Math.max(120, result[26] + result[28]), Math.max(120, result[27] + result[29]),
        Math.max(160, result[36] + result[38]), Math.max(120, result[37] + result[39]),
        Math.max(160, result[46] + result[48]), Math.max(180, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0026
     * @tc.name testEmbedPercentSequence0026
     * @tc.desc border-box percentages over content-box parent with vertical padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:4.75px 0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        Math.max(120, result[26] + result[28]), Math.max(120, result[27] + result[29]),
        Math.max(160, result[36] + result[38]), Math.max(120, result[37] + result[39]),
        Math.max(160, result[46] + result[48]), Math.max(180, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0027
     * @tc.name testEmbedPercentSequence0027
     * @tc.desc border-box percentages over content-box parent with unequal borders
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;border-width:2px 3px 4px 5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        Math.max(120, result[26] + result[28]), Math.max(120, result[27] + result[29]),
        Math.max(160, result[36] + result[38]), Math.max(120, result[37] + result[39]),
        Math.max(160, result[46] + result[48]), Math.max(180, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0028
     * @tc.name testEmbedPercentSequence0028
     * @tc.desc border-box percentages over content-box parent with mixed fractional padding and border
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:1.25px 2.75px;border:2px ' +
        'solid transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
        Math.max(120, result[26] + result[28]), Math.max(120, result[27] + result[29]),
        Math.max(160, result[36] + result[38]), Math.max(120, result[37] + result[39]),
        Math.max(160, result[46] + result[48]), Math.max(180, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0029
     * @tc.name testEmbedPercentSequence0029
     * @tc.desc content-box percentages over border-box parent with horizontal padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:border-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0 7.25px;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
      const basisWidth1: number = Math.max(0, 240 - 16 - result[32]);
      const basisHeight1: number = Math.max(0, 160 - 12 - result[33]);
      const basisWidth2: number = Math.max(0, 320 - 16 - result[42]);
      const basisHeight2: number = Math.max(0, 160 - 12 - result[43]);
      const basisWidth3: number = Math.max(0, 320 - 16 - result[52]);
      const basisHeight3: number = Math.max(0, 240 - 12 - result[53]);
      const cssExpected: number[] = [
        0.5 * basisWidth1, 0.75 * basisHeight1, 0.5 * basisWidth2, 0.75 * basisHeight2, 0.5 * basisWidth3,
        0.75 * basisHeight3
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0030
     * @tc.name testEmbedPercentSequence0030
     * @tc.desc content-box percentages over border-box parent with vertical padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:border-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:4.75px 0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
      const basisWidth1: number = Math.max(0, 240 - 16 - result[32]);
      const basisHeight1: number = Math.max(0, 160 - 12 - result[33]);
      const basisWidth2: number = Math.max(0, 320 - 16 - result[42]);
      const basisHeight2: number = Math.max(0, 160 - 12 - result[43]);
      const basisWidth3: number = Math.max(0, 320 - 16 - result[52]);
      const basisHeight3: number = Math.max(0, 240 - 12 - result[53]);
      const cssExpected: number[] = [
        0.5 * basisWidth1, 0.75 * basisHeight1, 0.5 * basisWidth2, 0.75 * basisHeight2, 0.5 * basisWidth3,
        0.75 * basisHeight3
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0031
     * @tc.name testEmbedPercentSequence0031
     * @tc.desc content-box percentages over border-box parent with unequal borders
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:border-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;border-width:2px 3px 4px 5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
      const basisWidth1: number = Math.max(0, 240 - 16 - result[32]);
      const basisHeight1: number = Math.max(0, 160 - 12 - result[33]);
      const basisWidth2: number = Math.max(0, 320 - 16 - result[42]);
      const basisHeight2: number = Math.max(0, 160 - 12 - result[43]);
      const basisWidth3: number = Math.max(0, 320 - 16 - result[52]);
      const basisHeight3: number = Math.max(0, 240 - 12 - result[53]);
      const cssExpected: number[] = [
        0.5 * basisWidth1, 0.75 * basisHeight1, 0.5 * basisWidth2, 0.75 * basisHeight2, 0.5 * basisWidth3,
        0.75 * basisHeight3
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0032
     * @tc.name testEmbedPercentSequence0032
     * @tc.desc content-box percentages over border-box parent with mixed fractional padding and border
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:border-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:1.25px 2.75px;border:2px ' +
        'solid transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
      const basisWidth1: number = Math.max(0, 240 - 16 - result[32]);
      const basisHeight1: number = Math.max(0, 160 - 12 - result[33]);
      const basisWidth2: number = Math.max(0, 320 - 16 - result[42]);
      const basisHeight2: number = Math.max(0, 160 - 12 - result[43]);
      const basisWidth3: number = Math.max(0, 320 - 16 - result[52]);
      const basisHeight3: number = Math.max(0, 240 - 12 - result[53]);
      const cssExpected: number[] = [
        0.5 * basisWidth1, 0.75 * basisHeight1, 0.5 * basisWidth2, 0.75 * basisHeight2, 0.5 * basisWidth3,
        0.75 * basisHeight3
      ];
      expect(Math.abs(result[24] - cssExpected[0]) < 0.03125 &&
        Math.abs(result[25] - cssExpected[1]) < 0.03125 &&
        result[30] === 0 && result[31] === 1).assertTrue();
      expect(Math.abs(result[34] - cssExpected[2]) < 0.03125 &&
        Math.abs(result[35] - cssExpected[3]) < 0.03125 &&
        result[40] === 0 && result[41] === 1).assertTrue();
      expect(Math.abs(result[44] - cssExpected[4]) < 0.03125 &&
        Math.abs(result[45] - cssExpected[5]) < 0.03125 &&
        result[50] === 0 && result[51] === 1).assertTrue();
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0033
     * @tc.name testEmbedPercentSequence0033
     * @tc.desc border-box percentages over border-box parent with horizontal padding
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:240px;height:160px;padding:6px 8px;border:3px ' +
        'solid transparent;box-sizing:border-box;\';' +
        '    node.style.cssText = \'display:block;width:50%;height:75%;padding:0 7.25px;border:0 solid ' +
        'transparent;box-sizing:border-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'320px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'240px\');' +
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
      const basisWidth1: number = Math.max(0, 240 - 16 - result[32]);
      const basisHeight1: number = Math.max(0, 160 - 12 - result[33]);
      const basisWidth2: number = Math.max(0, 320 - 16 - result[42]);
      const basisHeight2: number = Math.max(0, 160 - 12 - result[43]);
      const basisWidth3: number = Math.max(0, 320 - 16 - result[52]);
      const basisHeight3: number = Math.max(0, 240 - 12 - result[53]);
      const cssExpected: number[] = [
        Math.max(0.5 * basisWidth1, result[26] + result[28]),
        Math.max(0.75 * basisHeight1, result[27] + result[29]),
        Math.max(0.5 * basisWidth2, result[36] + result[38]),
        Math.max(0.75 * basisHeight2, result[37] + result[39]),
        Math.max(0.5 * basisWidth3, result[46] + result[48]),
        Math.max(0.75 * basisHeight3, result[47] + result[49])
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
