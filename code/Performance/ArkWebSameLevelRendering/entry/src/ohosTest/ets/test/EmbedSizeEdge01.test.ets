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

export default function embedSizeEdge01(host: EmbedDocumentHost): void {
  describe('EmbedSizeEdge01', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0001
     * @tc.name testEmbedSizeEdge0001
     * @tc.desc width rounding 0 to 0.25 to 0.75; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'0.75px\');' +
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
        0, 80.75, 0.25, 80.75, 0.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0002
     * @tc.name testEmbedSizeEdge0002
     * @tc.desc width rounding 0.25 to 0.5 to 1; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'1px\');' +
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
        0.25, 80.75, 0.5, 80.75, 1, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0003
     * @tc.name testEmbedSizeEdge0003
     * @tc.desc width rounding 0.49 to 0.5 to 0.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0.49px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'0.51px\');' +
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
        0.49, 80.75, 0.5, 80.75, 0.51, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0004
     * @tc.name testEmbedSizeEdge0004
     * @tc.desc width rounding 1 to 1.49 to 1.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:1px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'1.49px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'1.51px\');' +
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
        1, 80.75, 1.49, 80.75, 1.51, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0005
     * @tc.name testEmbedSizeEdge0005
     * @tc.desc width rounding 7.25 to 7.5 to 7.75; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:7.25px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'7.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'7.75px\');' +
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
        7.25, 80.75, 7.5, 80.75, 7.75, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0006
     * @tc.name testEmbedSizeEdge0006
     * @tc.desc width rounding 63.49 to 63.5 to 63.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:63.49px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'63.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'63.51px\');' +
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
        63.49, 80.75, 63.5, 80.75, 63.51, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0007
     * @tc.name testEmbedSizeEdge0007
     * @tc.desc height rounding 0 to 0.25 to 0.75; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'0.75px\');' +
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
        120.25, 0, 120.25, 0.25, 120.25, 0.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0008
     * @tc.name testEmbedSizeEdge0008
     * @tc.desc height rounding 0.25 to 0.5 to 1; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.5px\');' +
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
        120.25, 0.25, 120.25, 0.5, 120.25, 1
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0009
     * @tc.name testEmbedSizeEdge0009
     * @tc.desc height rounding 0.49 to 0.5 to 0.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0.49px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'0.51px\');' +
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
        120.25, 0.49, 120.25, 0.5, 120.25, 0.51
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0010
     * @tc.name testEmbedSizeEdge0010
     * @tc.desc height rounding 1 to 1.49 to 1.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:1px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'1.49px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'1.51px\');' +
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
        120.25, 1, 120.25, 1.49, 120.25, 1.51
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0011
     * @tc.name testEmbedSizeEdge0011
     * @tc.desc height rounding 7.25 to 7.5 to 7.75; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:7.25px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'7.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'7.75px\');' +
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
        120.25, 7.25, 120.25, 7.5, 120.25, 7.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0012
     * @tc.name testEmbedSizeEdge0012
     * @tc.desc height rounding 63.49 to 63.5 to 63.51; old snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:63.49px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'63.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'63.51px\');' +
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
        120.25, 63.49, 120.25, 63.5, 120.25, 63.51
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0013
     * @tc.name testEmbedSizeEdge0013
     * @tc.desc width 0 to 0.25, then height 0.75 to 0; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0px;height:0.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'0px\');' +
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
        0, 0.75, 0.25, 0.75, 0.25, 0
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0014
     * @tc.name testEmbedSizeEdge0014
     * @tc.desc width 0.25 to 0.5, then height 1 to 0.25; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0.25px;height:1px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'0.25px\');' +
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
        0.25, 1, 0.5, 1, 0.5, 0.25
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0015
     * @tc.name testEmbedSizeEdge0015
     * @tc.desc width 0.49 to 0.5, then height 0.51 to 0.49; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0.49px;height:0.51px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'0.49px\');' +
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
        0.49, 0.51, 0.5, 0.51, 0.5, 0.49
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0016
     * @tc.name testEmbedSizeEdge0016
     * @tc.desc width 1 to 1.49, then height 1.51 to 1; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:1px;height:1.51px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'1.49px\');' +
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
        1, 1.51, 1.49, 1.51, 1.49, 1
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0017
     * @tc.name testEmbedSizeEdge0017
     * @tc.desc width 7.25 to 7.5, then height 7.75 to 7.25; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:7.25px;height:7.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'7.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'7.25px\');' +
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
        7.25, 7.75, 7.5, 7.75, 7.5, 7.25
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0018
     * @tc.name testEmbedSizeEdge0018
     * @tc.desc width 63.49 to 63.5, then height 63.51 to 63.49; prior axis snapshots stay fixed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:63.49px;height:63.51px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'63.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'63.49px\');' +
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
        63.49, 63.51, 63.5, 63.51, 63.5, 63.49
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0019
     * @tc.name testEmbedSizeEdge0019
     * @tc.desc width minimum crosses zero and one
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-width:1px;\';' +
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
        Math.max(1, 0), 80.75, Math.max(1, 0.75), 80.75, Math.max(1, 1.75), 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0020
     * @tc.name testEmbedSizeEdge0020
     * @tc.desc width maximum clips only its own axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:9px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;max-width:4px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'3.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'7.75px\');' +
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
        Math.min(9, 4), 80.75, Math.min(3.25, 4), 80.75, Math.min(7.75, 4), 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0021
     * @tc.name testEmbedSizeEdge0021
     * @tc.desc width minimum wins conflicting maximum
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:6px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-width:8px;max-width:3px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'min-width\', \'2px\');' +
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
        Math.max(8, Math.min(6, 3)), 80.75, Math.max(2, Math.min(6, 3)), 80.75, Math.max(2, 6), 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0022
     * @tc.name testEmbedSizeEdge0022
     * @tc.desc width zero maximum releases after removal
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:17px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;max-width:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'max-width\', \'1px\');' +
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
        Math.min(17, 0), 80.75, Math.min(17, 1), 80.75, 17, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0023
     * @tc.name testEmbedSizeEdge0023
     * @tc.desc width fractional minimum and maximum round independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:0;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-width:0.25px;max-width:0.75px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'width\', \'2px\');' +
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
        Math.max(0.25, Math.min(0, 0.75)), 80.75, Math.max(0.25, Math.min(0.5, 0.75)), 80.75,
        Math.max(0.25, Math.min(2, 0.75)), 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0024
     * @tc.name testEmbedSizeEdge0024
     * @tc.desc width equal constraints remain stable until both clear
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:11px;height:80.75px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-width:5.5px;max-width:5.5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'width\', \'0\');' +
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
        Math.max(5.5, Math.min(11, 5.5)), 80.75, Math.max(5.5, Math.min(0, 5.5)), 80.75, 0, 80.75
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0025
     * @tc.name testEmbedSizeEdge0025
     * @tc.desc height minimum crosses zero and one
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-height:1px;\';' +
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
        120.25, Math.max(1, 0), 120.25, Math.max(1, 0.75), 120.25, Math.max(1, 1.75)
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0026
     * @tc.name testEmbedSizeEdge0026
     * @tc.desc height maximum clips only its own axis
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:9px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;max-height:4px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'3.25px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'7.75px\');' +
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
        120.25, Math.min(9, 4), 120.25, Math.min(3.25, 4), 120.25, Math.min(7.75, 4)
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0027
     * @tc.name testEmbedSizeEdge0027
     * @tc.desc height minimum wins conflicting maximum
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:6px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-height:8px;max-height:3px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'min-height\', \'2px\');' +
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
        120.25, Math.max(8, Math.min(6, 3)), 120.25, Math.max(2, Math.min(6, 3)), 120.25, Math.max(2, 6)
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0028
     * @tc.name testEmbedSizeEdge0028
     * @tc.desc height zero maximum releases after removal
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:17px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;max-height:0;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'max-height\', \'1px\');' +
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
        120.25, Math.min(17, 0), 120.25, Math.min(17, 1), 120.25, 17
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0029
     * @tc.name testEmbedSizeEdge0029
     * @tc.desc height fractional minimum and maximum round independently
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:0;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-height:0.25px;max-height:0.75px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0.5px\');' +
        '    const s2 = usedInputs(node, parent);' +
        '    const second = getEmbedSize(), r2 = node.getBoundingClientRect();' +
        '    values.push(second.width, second.height, r2.width, r2.height, node.clientWidth, node.clientHeight);' +
        '    node.style.setProperty(\'height\', \'2px\');' +
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
        120.25, Math.max(0.25, Math.min(0, 0.75)), 120.25, Math.max(0.25, Math.min(0.5, 0.75)), 120.25,
        Math.max(0.25, Math.min(2, 0.75))
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0030
     * @tc.name testEmbedSizeEdge0030
     * @tc.desc height equal constraints remain stable until both clear
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\'), parent = node.parentElement;' +
        '  const oldNode = node.getAttribute(\'style\'), oldParent = parent.getAttribute(\'style\');' +
        USED_STYLE_INPUTS +
        '  try {' +
        '    parent.style.cssText = \'display:block;width:512px;height:384px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;\';' +
        '    node.style.cssText = \'display:block;width:120.25px;height:11px;padding:0;border:0 solid ' +
        'transparent;box-sizing:content-box;margin:0;min-height:5.5px;max-height:5.5px;\';' +
        '    const s1 = usedInputs(node, parent);' +
        '    const first = getEmbedSize(), r1 = node.getBoundingClientRect();' +
        '    const values = [first.width, first.height, r1.width, r1.height, node.clientWidth, node.clientHeight];' +
        '    node.style.setProperty(\'height\', \'0\');' +
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
        120.25, Math.max(5.5, Math.min(11, 5.5)), 120.25, Math.max(5.5, Math.min(0, 5.5)), 120.25, 0
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0031
     * @tc.name testEmbedSizeEdge0031
     * @tc.desc node translate(11px, -7px) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'translate(11px, -7px)\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0032
     * @tc.name testEmbedSizeEdge0032
     * @tc.desc node scale(0) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'scale(0)\');' +
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
      expect(Math.abs(result[8] - (0)) < 0.03125 &&
        Math.abs(result[9] - (0)) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (0)) < 0.03125 &&
        Math.abs(result[15] - (0)) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0033
     * @tc.name testEmbedSizeEdge0033
     * @tc.desc node scaleX(0) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'scaleX(0)\');' +
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
      expect(Math.abs(result[8] - (0)) < 0.03125 &&
        Math.abs(result[9] - (secondOracle[3])) < 0.03125).assertTrue();
      expect(Math.abs(result[14] - (0)) < 0.03125 &&
        Math.abs(result[15] - (thirdOracle[3])) < 0.03125).assertTrue();
      expect([result[4], result[5], result[10], result[11], result[16], result[17]].join(','))
        .assertEqual([firstOracle[4], firstOracle[5], secondOracle[4], secondOracle[5],
          thirdOracle[4], thirdOracle[5]].join(','));
      expect(result.slice(18, 22).join(',')).assertEqual(expected.slice(0, 4).join(','));
      expect(result.slice(22, 24).join(',')).assertEqual('1,1');
    });

    /**
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0034
     * @tc.name testEmbedSizeEdge0034
     * @tc.desc node scaleY(0) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'scaleY(0)\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0035
     * @tc.name testEmbedSizeEdge0035
     * @tc.desc node scale(0.5) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'scale(0.5)\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0036
     * @tc.name testEmbedSizeEdge0036
     * @tc.desc node scale(2) keeps layout dimensions; the visual oracle and later height are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
        '    node.style.setProperty(\'transform\', \'scale(2)\');' +
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
     * @tc.number ARKWEB_EMBED_SIZE_EDGE_0037
     * @tc.name testEmbedSizeEdge0037
     * @tc.desc node scale(1.25, 0.75) keeps layout dimensions; the visual oracle and later width are checked
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSizeEdge0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: number[] = JSON.parse(await host.run(
        '(function () {' +
