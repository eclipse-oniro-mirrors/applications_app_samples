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

export default function embedSnapshotSequence02(host: EmbedDocumentHost): void {
  describe('EmbedSnapshotSequence02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0041
     * @tc.name testEmbedSnapshot0041
     * @tc.desc Later duplicate promotion and id retirement retain the original two snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 151px; height: 167px; padding: 0; border: 0;';
          side.appendChild(candidate);
          target.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retired'; stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('151,167');
      expect(result[6]).assertEqual('151,167');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0042
     * @tc.name testEmbedSnapshot0042
     * @tc.desc Later duplicate promotion and id retirement retain the original two snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 151px; height: 167px; padding: 0; border: 0;';
          side.appendChild(candidate);
          target.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retired'; stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('151,167');
      expect(result[6]).assertEqual('151,167');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0043
     * @tc.name testEmbedSnapshot0043
     * @tc.desc Later duplicate promotion and id retirement retain the original two snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 151px; height: 167px; padding: 0; border: 0;';
          side.appendChild(candidate);
          target.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retired'; stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('151,167');
      expect(result[6]).assertEqual('151,167');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0044
     * @tc.name testEmbedSnapshot0044
     * @tc.desc Later duplicate promotion and id retirement retain the original two snapshots: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 151px; height: 167px; padding: 0; border: 0;';
          side.appendChild(candidate);
          target.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.id = 'retired'; stage.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('151,167');
      expect(result[6]).assertEqual('151,167');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0045
     * @tc.name testEmbedSnapshot0045
     * @tc.desc Mutating the first returned object cannot alter a replacement snapshot or fresh read: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 283px; height: 59px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          first.width = -901; first.height = -703; candidate.style.height = '181px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('283,181');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('-901,-703');
      expect(result[5]).assertEqual('283,59');
      expect(result[6]).assertEqual('283,59');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0046
     * @tc.name testEmbedSnapshot0046
     * @tc.desc Mutating the first returned object cannot alter a replacement snapshot or fresh read: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 283px; height: 59px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          first.width = -901; first.height = -703; candidate.style.height = '181px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('283,181');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('-901,-703');
      expect(result[5]).assertEqual('283,59');
      expect(result[6]).assertEqual('283,59');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0047
     * @tc.name testEmbedSnapshot0047
     * @tc.desc Mutating the first returned object cannot alter a replacement snapshot or fresh read: live border-box
     * span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 283px; height: 59px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          first.width = -901; first.height = -703; candidate.style.height = '181px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('283,181');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('-901,-703');
      expect(result[5]).assertEqual('283,59');
      expect(result[6]).assertEqual('283,59');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0048
     * @tc.name testEmbedSnapshot0048
     * @tc.desc Mutating the first returned object cannot alter a replacement snapshot or fresh read: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 283px; height: 59px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          first.width = -901; first.height = -703; candidate.style.height = '181px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('283,181');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('-901,-703');
      expect(result[5]).assertEqual('283,59');
      expect(result[6]).assertEqual('283,59');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0049
     * @tc.name testEmbedSnapshot0049
     * @tc.desc Mutating the second returned object cannot alter the first or the next node snapshot: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 193px; height: 125px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          second.width = -809; second.height = -607;
          const successor = document.createElement('div'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 241px; height: 155px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('241,155');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('-809,-607');
      expect(result[6]).assertEqual('193,125');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0050
     * @tc.name testEmbedSnapshot0050
     * @tc.desc Mutating the second returned object cannot alter the first or the next node snapshot: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 193px; height: 125px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          second.width = -809; second.height = -607;
          const successor = document.createElement('div'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 241px; height: 155px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('241,155');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('-809,-607');
      expect(result[6]).assertEqual('193,125');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0051
     * @tc.name testEmbedSnapshot0051
     * @tc.desc Mutating the second returned object cannot alter the first or the next node snapshot: live border-box
     * span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 193px; height: 125px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          second.width = -809; second.height = -607;
          const successor = document.createElement('div'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 241px; height: 155px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('241,155');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('-809,-607');
      expect(result[6]).assertEqual('193,125');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0052
     * @tc.name testEmbedSnapshot0052
     * @tc.desc Mutating the second returned object cannot alter the first or the next node snapshot: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('span'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 193px; height: 125px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          second.width = -809; second.height = -607;
          const successor = document.createElement('div'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 241px; height: 155px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('241,155');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('-809,-607');
      expect(result[6]).assertEqual('193,125');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0053
     * @tc.name testEmbedSnapshot0053
     * @tc.desc Cloned successor resize never changes the original or clone-before-resize snapshot: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 227px; height: 101px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          target.style.cssText = 'display: block; width: 353px; height: 211px; padding: 0; border: 0;';
          candidate.style.width = '299px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('299,101');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('227,101');
      expect(result[6]).assertEqual('227,101');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0054
     * @tc.name testEmbedSnapshot0054
     * @tc.desc Cloned successor resize never changes the original or clone-before-resize snapshot: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 227px; height: 101px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          target.style.cssText = 'display: block; width: 353px; height: 211px; padding: 0; border: 0;';
          candidate.style.width = '299px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('299,101');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('227,101');
      expect(result[6]).assertEqual('227,101');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0055
     * @tc.name testEmbedSnapshot0055
     * @tc.desc Cloned successor resize never changes the original or clone-before-resize snapshot: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 227px; height: 101px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          target.style.cssText = 'display: block; width: 353px; height: 211px; padding: 0; border: 0;';
          candidate.style.width = '299px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('299,101');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('227,101');
      expect(result[6]).assertEqual('227,101');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0056
     * @tc.name testEmbedSnapshot0056
     * @tc.desc Cloned successor resize never changes the original or clone-before-resize snapshot: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        const marker = document.createElement('span'); marker.textContent = 'retained child';
        try {
          marker.style.display = 'none'; target.appendChild(marker);
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = target.cloneNode(false);
          candidate.style.cssText = 'display: block; width: 227px; height: 101px; padding: 0; border: 0;';
          stage.replaceChild(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild === null && target.firstElementChild === marker;
          target.style.cssText = 'display: block; width: 353px; height: 211px; padding: 0; border: 0;';
          candidate.style.width = '299px';
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(cloneEvidence)
          ]);
        } finally {
          marker.remove();
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('299,101');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('227,101');
      expect(result[6]).assertEqual('227,101');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0057
     * @tc.name testEmbedSnapshot0057
     * @tc.desc Reconnecting an old subtree after the replacement preserves replacement query ownership: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.remove();
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 109px; height: 191px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.appendChild(stage);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('109,191');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('109,191');
      expect(result[6]).assertEqual('109,191');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0058
     * @tc.name testEmbedSnapshot0058
     * @tc.desc Reconnecting an old subtree after the replacement preserves replacement query ownership: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          stage.remove();
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 109px; height: 191px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.appendChild(stage);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('109,191');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('109,191');
      expect(result[6]).assertEqual('109,191');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0059
     * @tc.name testEmbedSnapshot0059
     * @tc.desc Reconnecting an old subtree after the replacement preserves replacement query ownership: live
     * border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          stage.remove();
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 109px; height: 191px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.appendChild(stage);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('109,191');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('109,191');
      expect(result[6]).assertEqual('109,191');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0060
     * @tc.name testEmbedSnapshot0060
     * @tc.desc Reconnecting an old subtree after the replacement preserves replacement query ownership: live
     * replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.remove();
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 109px; height: 191px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.appendChild(stage);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('109,191');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('109,191');
      expect(result[6]).assertEqual('109,191');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0061
     * @tc.name testEmbedSnapshot0061
     * @tc.desc Percentage reparenting observes two live ancestor boxes without rewriting snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.style.cssText = 'width: 237px; height: 129px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 100%; height: 100%; padding: 0; border: 0;';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 311px; height: 183px; padding: 0; border: 0;';
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('311,183');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('237,129');
      expect(result[6]).assertEqual('237,129');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0062
     * @tc.name testEmbedSnapshot0062
     * @tc.desc Percentage reparenting observes two live ancestor boxes without rewriting snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          stage.style.cssText = 'width: 237px; height: 129px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 100%; height: 100%; padding: 0; border: 0;';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 311px; height: 183px; padding: 0; border: 0;';
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('311,183');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('237,129');
      expect(result[6]).assertEqual('237,129');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0063
     * @tc.name testEmbedSnapshot0063
     * @tc.desc Percentage reparenting observes two live ancestor boxes without rewriting snapshots: live border-box
     * span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          stage.style.cssText = 'width: 237px; height: 129px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 100%; height: 100%; padding: 0; border: 0;';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 311px; height: 183px; padding: 0; border: 0;';
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('311,183');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('237,129');
      expect(result[6]).assertEqual('237,129');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0064
     * @tc.name testEmbedSnapshot0064
     * @tc.desc Percentage reparenting observes two live ancestor boxes without rewriting snapshots: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.style.cssText = 'width: 237px; height: 129px; padding: 0; border: 0;';
          target.style.cssText = 'display: block; width: 100%; height: 100%; padding: 0; border: 0;';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          side.style.cssText = 'width: 311px; height: 183px; padding: 0; border: 0;';
          side.appendChild(target);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('311,183');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('237,129');
      expect(result[6]).assertEqual('237,129');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0065
     * @tc.name testEmbedSnapshot0065
     * @tc.desc Scaled ancestor then unscaled successor preserve untransformed offset snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.style.transform = 'scale(0.5)';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 271px; height: 121px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('271,121');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('173,71');
      expect(result[6]).assertEqual('86.5,35.5');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0066
     * @tc.name testEmbedSnapshot0066
     * @tc.desc Scaled ancestor then unscaled successor preserve untransformed offset snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          stage.style.transform = 'scale(0.5)';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 271px; height: 121px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('271,121');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('141,57');
      expect(result[6]).assertEqual('70.5,28.5');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0067
     * @tc.name testEmbedSnapshot0067
     * @tc.desc Scaled ancestor then unscaled successor preserve untransformed offset snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          stage.style.transform = 'scale(0.5)';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 271px; height: 121px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('271,121');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('211,97');
      expect(result[6]).assertEqual('105.5,48.5');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0068
     * @tc.name testEmbedSnapshot0068
     * @tc.desc Scaled ancestor then unscaled successor preserve untransformed offset snapshots: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('embed');
          target.setAttribute('type', 'native/component');
          target.setAttribute('src', 'view');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 83px; height: 137px; padding: 0; border: 0;';
          const first = getEmbedSize();
          stage.style.transform = 'scale(0.5)';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 271px; height: 121px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('271,121');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('83,137');
      expect(result[6]).assertEqual('41.5,68.5');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0069
     * @tc.name testEmbedSnapshot0069
     * @tc.desc Zero-box successor and nonzero span successor retain both earlier node snapshots: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = original;
        try {
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 173px; height: 71px; padding: 0; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 0px; height: 0px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 199px; height: 147px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('199,147');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0070
     * @tc.name testEmbedSnapshot0070
     * @tc.desc Zero-box successor and nonzero span successor retain both earlier node snapshots: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('div');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: block; width: 119px; height: 43px; padding: 7px 11px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 0px; height: 0px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 199px; height: 147px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
          if (savedId === null) { original.removeAttribute('id'); }
          else { original.setAttribute('id', savedId); }
          if (savedStyle === null) { original.removeAttribute('style'); }
          else { original.setAttribute('style', savedStyle); }
        }
      })()`)) as string[];
      expect(result[0]).assertEqual('199,147');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_SNAPSHOT_0071
     * @tc.name testEmbedSnapshot0071
     * @tc.desc Zero-box successor and nonzero span successor retain both earlier node snapshots: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedSnapshot0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = JSON.parse(await host.run(`(() => {
        const original = nativeEmbed.nativeSearch;
        const parent = original.parentNode; const next = original.nextSibling;
        const savedStyle = original.getAttribute('style'); const savedId = original.getAttribute('id');
        const stage = document.createElement('div'); const side = document.createElement('div');
        parent.insertBefore(stage, original); parent.insertBefore(side, original);
        const target = document.createElement('span');
        try {
          original.id = 'cachedOriginal'; target.id = 'nativeSearch';
          stage.appendChild(target);
          target.style.cssText = 'display: inline-block; box-sizing: border-box; width: 211px;' +
            'height: 97px; padding: 4px; border: 0;';
          const first = getEmbedSize();
          const candidate = document.createElement('div'); candidate.id = 'pending';
          candidate.style.cssText = 'display: block; width: 0px; height: 0px; padding: 0; border: 0;';
          side.appendChild(candidate);
          candidate.id = 'nativeSearch'; target.replaceWith(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const successor = document.createElement('span'); successor.id = 'pending';
          successor.style.cssText = 'display: block; width: 199px; height: 147px; padding: 0; border: 0;';
          side.appendChild(successor);
          successor.id = 'nativeSearch'; candidate.replaceWith(successor);
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === successor), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight))
          ]);
        } finally {
          parent.insertBefore(original, next); stage.remove(); side.remove();
          if (target !== original) { target.remove(); }
