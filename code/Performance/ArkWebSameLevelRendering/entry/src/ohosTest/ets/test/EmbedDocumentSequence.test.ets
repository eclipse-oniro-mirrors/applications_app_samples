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

import { afterAll, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { EmbedDocumentHost } from './EmbedDocumentHost';
import { logCase } from './shared/TestLog';
import { paceTurn } from './shared/TestPace';

export default function embedDocumentSequence(host: EmbedDocumentHost): void {
  describe('EmbedDocumentSequence', () => {

    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    afterAll(async () => {
      await host.close();
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0001
     * @tc.name testEmbedDocumentSequence0001
     * @tc.desc 初始化为当前嵌入节点注册原始触摸回调，重复初始化保留相同回调
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0001';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const records = window.__embedProbeRegistrations;' +
        '  const entry = records[0];' +
        '  const result = [String(records.length), entry.type, String(entry.options),' +
        '    String(entry.listener === nativeEmbed.events),' +
        '    String(entry.target === document.getElementById(\'nativeSearch\'))];' +
        '  nativeEmbed.init();' +
        '  result.push(String(records.length));' +
        '  return JSON.stringify(result);' +
        '})()'
      )) as string[];
      logCase(caseName, '初始化仅注册一次：' + result[0]);
      expect(result[0]).assertEqual('1');
      logCase(caseName, '注册事件名称：' + result[1]);
      expect(result[1]).assertEqual('touchstart');
      logCase(caseName, '注册第三参数：' + result[2]);
      expect(result[2]).assertEqual('false');
      logCase(caseName, '注册回调为原始 events 对象：' + result[3]);
      expect(result[3]).assertEqual('true');
      logCase(caseName, '注册目标为当前 nativeSearch：' + result[4]);
      expect(result[4]).assertEqual('true');
      logCase(caseName, '调用真实 init 后累计注册次数：' + result[5]);
      expect(result[5]).assertEqual('2');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0002
     * @tc.name testEmbedDocumentSequence0002
     * @tc.desc 不等宽高的嵌入节点返回准确尺寸与完整字段
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0002';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const size = getEmbedSize();' +
        '  const rect = node.getBoundingClientRect();' +
        '  return JSON.stringify([String(size.width), String(size.height),' +
        '    String(rect.width), String(rect.height), Object.keys(size).sort().join(\',\')]);' +
        '})()'
      )) as string[];
      logCase(caseName, '业务返回宽高：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual('173,71');
      logCase(caseName, '业务尺寸与独立矩形宽高：' + result.join(','));
      expect(result.slice(0, 2).join(',')).assertEqual(result.slice(2, 4).join(','));
      logCase(caseName, '返回对象字段：' + result[4]);
      expect(result[4]).assertEqual('height,width');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0003
     * @tc.name testEmbedDocumentSequence0003
     * @tc.desc 同一节点依次修改宽和高，先前返回的尺寸对象保持不变
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0003';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const first = getEmbedSize();' +
        '  const initial = [first.width, first.height];' +
        '  node.style.width = \'289px\';' +
        '  const second = getEmbedSize();' +
        '  node.style.height = \'113px\';' +
        '  const third = getEmbedSize();' +
        '  return JSON.stringify(initial.concat([second.width, second.height,' +
        '    third.width, third.height, first.width, first.height]));' +
        '})()'
      )) as number[];
      logCase(caseName, '初始返回宽高：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual('173,71');
      logCase(caseName, '仅改变宽度后的返回值：' + result.slice(2, 4).join(','));
      expect(result.slice(2, 4).join(',')).assertEqual('289,71');
      logCase(caseName, '继续改变高度后的返回值：' + result.slice(4, 6).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual('289,113');
      logCase(caseName, '保留的首次对象宽高：' + result.slice(6, 8).join(','));
      expect(result.slice(6, 8).join(',')).assertEqual('173,71');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0004
     * @tc.name testEmbedDocumentSequence0004
     * @tc.desc 可见性隐藏保留布局尺寸，移除显示后尺寸归零，再显示时恢复
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0004';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\', visibility: \'hidden\' });' +
        '  const hidden = getEmbedSize();' +
        '  node.style.display = \'none\';' +
        '  const removed = getEmbedSize();' +
        '  node.style.display = \'block\';' +
        '  node.style.visibility = \'visible\';' +
        '  const restored = getEmbedSize();' +
        '  return JSON.stringify([hidden.width, hidden.height, removed.width, removed.height,' +
        '    restored.width, restored.height]);' +
        '})()'
      )) as number[];
      logCase(caseName, 'visibility 隐藏时的业务尺寸：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual('173,71');
      logCase(caseName, 'display 隐藏时的业务尺寸：' + result.slice(2, 4).join(','));
      expect(result.slice(2, 4).join(',')).assertEqual('0,0');
      logCase(caseName, '重新显示时的业务尺寸：' + result.slice(4, 6).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual('173,71');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0005
     * @tc.name testEmbedDocumentSequence0005
     * @tc.desc 内容盒尺寸包含内边距和边框，客户端尺寸与边界差符合实际布局
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0005';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'119px\', height: \'43px\',' +
        '    padding: \'7px 11px\', border: \'3px solid transparent\', boxSizing: \'content-box\' });' +
        '  const size = getEmbedSize();' +
        '  const rect = node.getBoundingClientRect();' +
        '  const style = getComputedStyle(node);' +
        '  const borderWidth = parseFloat(style.borderLeftWidth) + parseFloat(style.borderRightWidth);' +
        '  const borderHeight = parseFloat(style.borderTopWidth) + parseFloat(style.borderBottomWidth);' +
        '  return JSON.stringify([size.width, size.height, node.clientWidth, node.clientHeight,' +
        '    rect.width, rect.height, borderWidth, borderHeight]);' +
        '})()'
      )) as number[];
      logCase(caseName, '包含内边距与边框的业务尺寸：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual(
        [Math.round(119 + 22 + result[6]), Math.round(43 + 14 + result[7])].join(','));
      logCase(caseName, '客户端尺寸不包含实际使用的边框：' + result.join(','));
      expect(result.slice(2, 4).join(',')).assertEqual('141,57');
      logCase(caseName, '业务尺寸与独立矩形边界：' + result.join(','));
      expect(result.slice(0, 2).join(',')).assertEqual([Math.round(result[4]), Math.round(result[5])].join(','));
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0006
     * @tc.name testEmbedDocumentSequence0006
     * @tc.desc 缩放改变可视矩形尺寸而不改变业务读取的布局宽高
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0006';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\', transform: \'scale(0.5)\' });' +
        '  const size = getEmbedSize();' +
        '  const rect = node.getBoundingClientRect();' +
        '  return JSON.stringify([size.width, size.height, rect.width, rect.height,' +
        '    size.width / rect.width, size.height / rect.height]);' +
        '})()'
      )) as number[];
      logCase(caseName, '缩放后的业务布局宽度：' + result[0]);
      expect(result[0]).assertEqual(173);
      logCase(caseName, '缩放后的业务布局高度：' + result[1]);
      expect(result[1]).assertEqual(71);
      logCase(caseName, '布局与可视尺寸的比值：' + result.slice(4, 6).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual('2,2');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0007
     * @tc.name testEmbedDocumentSequence0007
     * @tc.desc 百分比嵌入尺寸随父节点宽高变化并与父节点客户端尺寸一致
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0007';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  const parent = node.parentElement;' +
        '  Object.assign(parent.style, { display: \'block\', width: \'197px\', height: \'113px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  Object.assign(node.style, { display: \'block\', width: \'100%\', height: \'100%\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const first = getEmbedSize();' +
        '  const firstParent = [parent.clientWidth, parent.clientHeight];' +
        '  parent.style.width = \'253px\';' +
        '  parent.style.height = \'179px\';' +
        '  const second = getEmbedSize();' +
        '  return JSON.stringify([first.width, first.height].concat(firstParent,' +
        '    [second.width, second.height, parent.clientWidth, parent.clientHeight]));' +
        '})()'
      )) as number[];
      logCase(caseName, '初始百分比业务尺寸：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual('197,113');
      logCase(caseName, '初始业务尺寸与父客户端尺寸交叉验证：' + result.slice(2, 4).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual(result.slice(2, 4).join(','));
      logCase(caseName, '父节点变化后的业务尺寸：' + result.slice(4, 6).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual('253,179');
      logCase(caseName, '变化后的业务尺寸与父客户端尺寸交叉验证：' + result.slice(6, 8).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual(result.slice(6, 8).join(','));
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0008
     * @tc.name testEmbedDocumentSequence0008
     * @tc.desc 同标识节点替换后读取新节点尺寸，原始初始化引用保持原节点
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0008';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const original = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(original.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const first = getEmbedSize();' +
        '  const replacement = original.cloneNode(false);' +
        '  replacement.style.width = \'213px\';' +
        '  replacement.style.height = \'67px\';' +
        '  original.parentNode.replaceChild(replacement, original);' +
        '  const second = getEmbedSize();' +
        '  replacement.style.height = \'101px\';' +
        '  const third = getEmbedSize();' +
        '  return JSON.stringify([String(first.width), String(first.height),' +
        '    String(second.width), String(second.height), String(third.width), String(third.height),' +
        '    String(nativeEmbed.nativeSearch === original)]);' +
        '})()'
      )) as string[];
      logCase(caseName, '原节点的业务返回尺寸：' + result.slice(0, 2).join(','));
      expect(result.slice(0, 2).join(',')).assertEqual('173,71');
      logCase(caseName, '替换节点的业务返回尺寸：' + result.slice(2, 4).join(','));
      expect(result.slice(2, 4).join(',')).assertEqual('213,67');
      logCase(caseName, '替换节点再次变高的业务返回尺寸：' + result.slice(4, 6).join(','));
      expect(result.slice(4, 6).join(',')).assertEqual('213,101');
      logCase(caseName, '初始化引用仍指向原节点：' + result[6]);
      expect(result[6]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0009
     * @tc.name testEmbedDocumentSequence0009
     * @tc.desc 节点临时脱离文档时读取抛出类型错误，插回后尺寸和字段恢复
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0009';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const parent = node.parentNode;' +
        '  const next = node.nextSibling;' +
        '  let errorName = \'\';' +
        '  let producedResult = false;' +
        '  try {' +
        '    parent.removeChild(node);' +
        '    const detachedSize = getEmbedSize();' +
        '    producedResult = detachedSize !== undefined;' +
        '  } catch (error) {' +
        '    errorName = error.name;' +
        '  } finally {' +
        '    parent.insertBefore(node, next);' +
        '  }' +
        '  const restored = getEmbedSize();' +
        '  return JSON.stringify([errorName, String(producedResult), String(restored.width),' +
        '    String(restored.height), Object.keys(restored).sort().join(\',\')]);' +
        '})()'
      )) as string[];
      logCase(caseName, '真实缺失节点读取的异常名称：' + result[0]);
      expect(result[0]).assertEqual('TypeError');
      logCase(caseName, '脱离时是否产生尺寸返回结果：' + result[1]);
      expect(result[1]).assertEqual('false');
      logCase(caseName, '插回原父节点后的业务尺寸：' + result.slice(2, 4).join(','));
      expect(result.slice(2, 4).join(',')).assertEqual('173,71');
      logCase(caseName, '恢复后的返回对象字段：' + result[4]);
      expect(result[4]).assertEqual('height,width');
    });

    /**
     * @tc.number ARKWEB_EMBED_DOCUMENT_0010
     * @tc.name testEmbedDocumentSequence0010
     * @tc.desc 每次读取返回独立尺寸对象，修改旧对象不影响已有或后续结果
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedDocumentSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName = 'testEmbedDocumentSequence0010';
      const result = JSON.parse(await host.run(
        '(function () {' +
        '  const node = document.getElementById(\'nativeSearch\');' +
        '  Object.assign(node.style, { display: \'block\', width: \'173px\', height: \'71px\',' +
        '    padding: \'0\', border: \'0\', boxSizing: \'content-box\' });' +
        '  const first = getEmbedSize();' +
        '  const second = getEmbedSize();' +
        '  const shared = first === second;' +
        '  first.width = -999;' +
        '  first.height = -777;' +
        '  const third = getEmbedSize();' +
        '  return JSON.stringify([String(shared), String(second.width), String(second.height),' +
        '    String(third.width), String(third.height)]);' +
        '})()'
      )) as string[];
      logCase(caseName, '连续返回对象是否共用：' + result[0]);
      expect(result[0]).assertEqual('false');
      logCase(caseName, '修改首个对象后第二个对象的尺寸：' + result.slice(1, 3).join(','));
      expect(result.slice(1, 3).join(',')).assertEqual('173,71');
      logCase(caseName, '修改首个对象后重新读取的尺寸：' + result.slice(3, 5).join(','));
      expect(result.slice(3, 5).join(',')).assertEqual('173,71');
    });
  });
}
