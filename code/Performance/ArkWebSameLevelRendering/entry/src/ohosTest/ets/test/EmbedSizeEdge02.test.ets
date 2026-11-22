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

export default function embedSizeEdge02(host: EmbedDocumentHost): void {
  describe('EmbedSizeEdge02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0046
     * @tc.name testEmbedSizeEdge0046
     * @tc.desc parent scaleY(0) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'scaleY(0)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'96px\');' +
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
        64, 32, 64, 32, 64, 96
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
        Math.abs(result[9] - (0)) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (0)) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0047
     * @tc.name testEmbedSizeEdge0047
     * @tc.desc parent scale(0.5) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'scale(0.5)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'96px\');' +
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
        64, 32, 64, 32, 96, 32
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
      expect(Math.abs(result[8] - ((secondOracle[2]) * 0.5)) < 0.03125 &&
        Math.abs(result[9] - ((secondOracle[3]) * 0.5)) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - ((thirdOracle[2]) * 0.5)) < 0.03125 &&
        Math.abs(result[15] - ((thirdOracle[3]) * 0.5)) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0048
     * @tc.name testEmbedSizeEdge0048
     * @tc.desc parent scale(2) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'scale(2)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'96px\');' +
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
        64, 32, 64, 32, 64, 96
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
      expect(Math.abs(result[8] - ((secondOracle[2]) * 2)) < 0.03125 &&
        Math.abs(result[9] - ((secondOracle[3]) * 2)) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - ((thirdOracle[2]) * 2)) < 0.03125 &&
        Math.abs(result[15] - ((thirdOracle[3]) * 2)) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0049
     * @tc.name testEmbedSizeEdge0049
     * @tc.desc parent scale(1.25, 0.75) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'scale(1.25, 0.75)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'96px\');' +
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
        64, 32, 64, 32, 96, 32
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
      expect(Math.abs(result[8] - ((secondOracle[2]) * 1.25)) < 0.03125 &&
        Math.abs(result[9] - ((secondOracle[3]) * 0.75)) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - ((thirdOracle[2]) * 1.25)) < 0.03125 &&
        Math.abs(result[15] - ((thirdOracle[3]) * 0.75)) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0050
     * @tc.name testEmbedSizeEdge0050
     * @tc.desc parent scale(-1, 1) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'scale(-1, 1)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'96px\');' +
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
        64, 32, 64, 32, 64, 96
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0051
     * @tc.name testEmbedSizeEdge0051
     * @tc.desc parent rotate(90deg) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'rotate(90deg)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'96px\');' +
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
        64, 32, 64, 32, 96, 32
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
      expect(Math.abs(result[8] - (secondOracle[3])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[2])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[3])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[2])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0052
     * @tc.name testEmbedSizeEdge0052
     * @tc.desc parent rotate(180deg) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'rotate(180deg)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'96px\');' +
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
        64, 32, 64, 32, 64, 96
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0053
     * @tc.name testEmbedSizeEdge0053
     * @tc.desc parent skewX(45deg) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'skewX(45deg)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'96px\');' +
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
        64, 32, 64, 32, 96, 32
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
      expect(Math.abs(result[8] - (secondOracle[2] + secondOracle[3])) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2] + thirdOracle[3])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0054
     * @tc.name testEmbedSizeEdge0054
     * @tc.desc parent skewY(45deg) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'transform\', \'skewY(45deg)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'96px\');' +
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
        64, 32, 64, 32, 64, 96
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
        Math.abs(result[9] - (secondOracle[3] + secondOracle[2])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (thirdOracle[2])) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3] + thirdOracle[2])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0055
     * @tc.name testEmbedSizeEdge0055
     * @tc.desc zero-content: node hidden then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'visibility\', \'hidden\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0056
     * @tc.name testEmbedSizeEdge0056
     * @tc.desc zero-content: node collapse then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'visibility\', \'collapse\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0057
     * @tc.name testEmbedSizeEdge0057
     * @tc.desc zero-content: node display none then block; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'display\', \'none\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'display\', \'block\');' +
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
        result[40] === 0 && result[41] === 0).assertTrue();
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0058
     * @tc.name testEmbedSizeEdge0058
     * @tc.desc zero-content: block to inline-block then inline; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'display\', \'inline-block\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'display\', \'inline\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0059
     * @tc.name testEmbedSizeEdge0059
     * @tc.desc zero-content: parent display none then block; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'display\', \'none\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'display\', \'block\');' +
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
        result[40] === 0 && result[41] === 0).assertTrue();
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0060
     * @tc.name testEmbedSizeEdge0060
     * @tc.desc zero-content: parent hidden then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:0;border:0 solid transparent;' +
        'box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'visibility\', \'hidden\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0061
     * @tc.name testEmbedSizeEdge0061
     * @tc.desc decorated-zero: node hidden then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'visibility\', \'hidden\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0062
     * @tc.name testEmbedSizeEdge0062
     * @tc.desc decorated-zero: node collapse then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'visibility\', \'collapse\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0063
     * @tc.name testEmbedSizeEdge0063
     * @tc.desc decorated-zero: node display none then block; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'display\', \'none\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'display\', \'block\');' +
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
        result[40] === 0 && result[41] === 0).assertTrue();
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0064
     * @tc.name testEmbedSizeEdge0064
     * @tc.desc decorated-zero: block to inline-block then inline; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'display\', \'inline-block\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'display\', \'inline\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0065
     * @tc.name testEmbedSizeEdge0065
     * @tc.desc decorated-zero: parent display none then block; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'display\', \'none\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'display\', \'block\');' +
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
        result[40] === 0 && result[41] === 0).assertTrue();
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0066
     * @tc.name testEmbedSizeEdge0066
     * @tc.desc decorated-zero: parent hidden then visible; earlier size objects remain immutable
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:0;padding:1px 2px;border:1px solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    parent.style.setProperty(\'visibility\', \'hidden\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    parent.style.setProperty(\'visibility\', \'visible\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0067
     * @tc.name testEmbedSizeEdge0067
     * @tc.desc width rejects CSS -1px then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'-1px\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0068
     * @tc.name testEmbedSizeEdge0068
     * @tc.desc width rejects CSS 12qu then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'12qu\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0069
     * @tc.name testEmbedSizeEdge0069
     * @tc.desc width rejects CSS NaNpx then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'NaNpx\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0070
     * @tc.name testEmbedSizeEdge0070
     * @tc.desc width rejects CSS Infinitypx then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'Infinitypx\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0071
     * @tc.name testEmbedSizeEdge0071
     * @tc.desc width rejects CSS -20% then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'-20%\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0072
     * @tc.name testEmbedSizeEdge0072
     * @tc.desc width rejects CSS --bad then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'--bad\');' +
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
        17.25, 80.75, 17.25, 80.75, 1.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0073
     * @tc.name testEmbedSizeEdge0073
     * @tc.desc height rejects CSS -1px then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'-1px\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0074
     * @tc.name testEmbedSizeEdge0074
     * @tc.desc height rejects CSS 12qu then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'12qu\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0075
     * @tc.name testEmbedSizeEdge0075
     * @tc.desc height rejects CSS NaNpx then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'NaNpx\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0076
     * @tc.name testEmbedSizeEdge0076
     * @tc.desc height rejects CSS Infinitypx then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'Infinitypx\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0077
     * @tc.name testEmbedSizeEdge0077
     * @tc.desc height rejects CSS -20% then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'-20%\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0078
     * @tc.name testEmbedSizeEdge0078
     * @tc.desc height rejects CSS --bad then accepts a fractional replacement
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'--bad\');' +
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
        120.25, 17.25, 120.25, 17.25, 120.25, 1.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0079
     * @tc.name testEmbedSizeEdge0079
     * @tc.desc margin 13px 17px leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'margin\', \'13px 17px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0080
     * @tc.name testEmbedSizeEdge0080
     * @tc.desc outline 9px solid black leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'outline\', \'9px solid black\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0081
     * @tc.name testEmbedSizeEdge0081
     * @tc.desc outline-offset 11px leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;outline:2px solid black;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'outline-offset\', \'11px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0082
     * @tc.name testEmbedSizeEdge0082
     * @tc.desc position relative leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'position\', \'relative\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0083
     * @tc.name testEmbedSizeEdge0083
     * @tc.desc position absolute leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'position\', \'absolute\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0084
     * @tc.name testEmbedSizeEdge0084
     * @tc.desc position fixed leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'position\', \'fixed\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0085
     * @tc.name testEmbedSizeEdge0085
     * @tc.desc opacity 0 leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'opacity\', \'0\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0086
     * @tc.name testEmbedSizeEdge0086
     * @tc.desc overflow hidden leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'overflow\', \'hidden\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0087
     * @tc.name testEmbedSizeEdge0087
     * @tc.desc overflow clip leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'overflow\', \'clip\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0088
     * @tc.name testEmbedSizeEdge0088
     * @tc.desc filter blur(2px) leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'filter\', \'blur(2px)\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0089
     * @tc.name testEmbedSizeEdge0089
     * @tc.desc direction rtl leaves layout offsets intact before a real width change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'direction\', \'rtl\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'48px\');' +
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
        64, 32, 64, 32, 48, 32
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0090
     * @tc.name testEmbedSizeEdge0090
     * @tc.desc writing-mode vertical-rl leaves layout offsets intact before a real height change
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:64px;height:32px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'writing-mode\', \'vertical-rl\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'48px\');' +
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
        64, 32, 64, 32, 64, 48
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
  });
}
