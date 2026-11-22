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

export default function embedPercentSequence02(host: EmbedDocumentHost): void {
  describe('EmbedPercentSequence02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0046
     * @tc.name testEmbedPercentSequence0046
     * @tc.desc content-box height fractional pixel minimum with percentage maximum reacts to expanding then zero
     * parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;min-height:10.5px;max-height:50%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'0\');' +
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
        60, Math.max(10.5, Math.min(60, 40)), 60, Math.max(10.5, Math.min(150, 100)), 60,
        Math.max(10.5, Math.min(0, 0))
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0047
     * @tc.name testEmbedPercentSequence0047
     * @tc.desc border-box width pixel minimum and maximum reacts to expanding then zero parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-width:30px;max-width:100px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'0\');' +
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
        Math.max(Math.max(30, Math.min(60, 100)), result[26] + result[28]), Math.max(60, result[27] + result[29]),
        Math.max(Math.max(30, Math.min(150, 100)), result[36] + result[38]), Math.max(60, result[37] + result[39]),
        Math.max(Math.max(30, Math.min(0, 100)), result[46] + result[48]), Math.max(60, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0048
     * @tc.name testEmbedPercentSequence0048
     * @tc.desc border-box width percentage maximum below specified percentage reacts to expanding then zero parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;max-width:40%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'0\');' +
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
        Math.max(Math.min(60, 32), result[26] + result[28]), Math.max(60, result[27] + result[29]),
        Math.max(Math.min(150, 80), result[36] + result[38]), Math.max(60, result[37] + result[39]),
        Math.max(Math.min(0, 0), result[46] + result[48]), Math.max(60, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0049
     * @tc.name testEmbedPercentSequence0049
     * @tc.desc border-box width percentage minimum above specified percentage reacts to expanding then zero parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-width:90%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'0\');' +
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
        Math.max(Math.max(72, 60), result[26] + result[28]), Math.max(60, result[27] + result[29]),
        Math.max(Math.max(180, 150), result[36] + result[38]), Math.max(60, result[37] + result[39]),
        Math.max(Math.max(0, 0), result[46] + result[48]), Math.max(60, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0050
     * @tc.name testEmbedPercentSequence0050
     * @tc.desc border-box width conflicting percentage constraints reacts to expanding then zero parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-width:80%;max-width:20%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'0\');' +
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
        Math.max(Math.max(64, Math.min(60, 16)), result[26] + result[28]), Math.max(60, result[27] + result[29]),
        Math.max(Math.max(160, Math.min(150, 40)), result[36] + result[38]), Math.max(60, result[37] + result[39]),
        Math.max(Math.max(0, Math.min(0, 0)), result[46] + result[48]), Math.max(60, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0051
     * @tc.name testEmbedPercentSequence0051
     * @tc.desc border-box width fractional pixel minimum with percentage maximum reacts to expanding then zero
     * parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-width:10.5px;max-width:50%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'width\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'width\', \'0\');' +
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
        Math.max(Math.max(10.5, Math.min(60, 40)), result[26] + result[28]), Math.max(60, result[27] + result[29]),
        Math.max(Math.max(10.5, Math.min(150, 100)), result[36] + result[38]),
        Math.max(60, result[37] + result[39]), Math.max(Math.max(10.5, Math.min(0, 0)), result[46] + result[48]),
        Math.max(60, result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0052
     * @tc.name testEmbedPercentSequence0052
     * @tc.desc border-box height pixel minimum and maximum reacts to expanding then zero parent axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-height:30px;max-height:100px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'0\');' +
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
        Math.max(60, result[26] + result[28]), Math.max(Math.max(30, Math.min(60, 100)), result[27] + result[29]),
        Math.max(60, result[36] + result[38]), Math.max(Math.max(30, Math.min(150, 100)), result[37] + result[39]),
        Math.max(60, result[46] + result[48]), Math.max(Math.max(30, Math.min(0, 100)), result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0053
     * @tc.name testEmbedPercentSequence0053
     * @tc.desc border-box height percentage maximum below specified percentage reacts to expanding then zero parent
     * axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;max-height:40%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'0\');' +
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
        Math.max(60, result[26] + result[28]), Math.max(Math.min(60, 32), result[27] + result[29]),
        Math.max(60, result[36] + result[38]), Math.max(Math.min(150, 80), result[37] + result[39]),
        Math.max(60, result[46] + result[48]), Math.max(Math.min(0, 0), result[47] + result[49])
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
     * @tc.number ARKWEB_EMBED_PERCENT_SEQUENCE_0054
     * @tc.name testEmbedPercentSequence0054
     * @tc.desc border-box height percentage minimum above specified percentage reacts to expanding then zero parent
     * axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedPercentSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:80px;height:80px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:75%;height:75%;padding:2px 3px;border:1px solid ' +
        'transparent;box-sizing:border-box;margin:0;min-height:90%;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'height\', \'200px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'height\', \'0\');' +
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
        Math.max(60, result[26] + result[28]), Math.max(Math.max(72, 60), result[27] + result[29]),
        Math.max(60, result[36] + result[38]), Math.max(Math.max(180, 150), result[37] + result[39]),
