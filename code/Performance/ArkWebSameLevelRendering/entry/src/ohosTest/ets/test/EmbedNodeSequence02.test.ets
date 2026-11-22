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

export default function embedNodeSequence02(host: EmbedDocumentHost): void {
  describe('EmbedNodeSequence02', () => {
    beforeAll(async () => {
      await host.open();
    });

    beforeEach(async () => {
      await paceTurn();
      await host.reset();
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0037
     * @tc.name testEmbedNode0037
     * @tc.desc Remove a duplicate-bearing ancestor to promote the later same-id node: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 139px; height: 163px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.insertBefore(stage, side);
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
      expect(result[5]).assertEqual('139,163');
      expect(result[6]).assertEqual('139,163');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0038
     * @tc.name testEmbedNode0038
     * @tc.desc Remove a duplicate-bearing ancestor to promote the later same-id node: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 139px; height: 163px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.insertBefore(stage, side);
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
      expect(result[5]).assertEqual('139,163');
      expect(result[6]).assertEqual('139,163');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0039
     * @tc.name testEmbedNode0039
     * @tc.desc Remove a duplicate-bearing ancestor to promote the later same-id node: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 139px; height: 163px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.insertBefore(stage, side);
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
      expect(result[5]).assertEqual('139,163');
      expect(result[6]).assertEqual('139,163');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0040
     * @tc.name testEmbedNode0040
     * @tc.desc Remove a duplicate-bearing ancestor to promote the later same-id node: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 139px; height: 163px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          parent.insertBefore(stage, side);
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
      expect(result[5]).assertEqual('139,163');
      expect(result[6]).assertEqual('139,163');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0041
     * @tc.name testEmbedNode0041
     * @tc.desc Hidden ancestor has zero offsets until the queried child is moved into a visible ancestor: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
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
      expect(result[0]).assertEqual('173,71');
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
     * @tc.number ARKWEB_EMBED_NODE_0042
     * @tc.name testEmbedNode0042
     * @tc.desc Hidden ancestor has zero offsets until the queried child is moved into a visible ancestor: live padded
     * div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
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
      expect(result[0]).assertEqual('141,57');
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
     * @tc.number ARKWEB_EMBED_NODE_0043
     * @tc.name testEmbedNode0043
     * @tc.desc Hidden ancestor has zero offsets until the queried child is moved into a visible ancestor: live
     * border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
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
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0044
     * @tc.name testEmbedNode0044
     * @tc.desc Hidden ancestor has zero offsets until the queried child is moved into a visible ancestor: live
     * replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          stage.style.display = 'none';
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
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
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('0,0');
      expect(result[6]).assertEqual('0,0');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0045
     * @tc.name testEmbedNode0045
     * @tc.desc Move the predecessor into a fragment, then promote it again ahead of the replacement: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 223px; height: 131px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(fragment);
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
      expect(result[5]).assertEqual('223,131');
      expect(result[6]).assertEqual('223,131');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0046
     * @tc.name testEmbedNode0046
     * @tc.desc Move the predecessor into a fragment, then promote it again ahead of the replacement: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 223px; height: 131px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(fragment);
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
      expect(result[5]).assertEqual('223,131');
      expect(result[6]).assertEqual('223,131');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0047
     * @tc.name testEmbedNode0047
     * @tc.desc Move the predecessor into a fragment, then promote it again ahead of the replacement: live border-box
     * span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 223px; height: 131px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(fragment);
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
      expect(result[5]).assertEqual('223,131');
      expect(result[6]).assertEqual('223,131');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0048
     * @tc.name testEmbedNode0048
     * @tc.desc Move the predecessor into a fragment, then promote it again ahead of the replacement: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const fragment = document.createDocumentFragment(); fragment.appendChild(target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 223px; height: 131px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(fragment);
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
      expect(result[5]).assertEqual('223,131');
      expect(result[6]).assertEqual('223,131');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0049
     * @tc.name testEmbedNode0049
     * @tc.desc A renamed connected predecessor does not mask the new exact-id element: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'connectedPredecessor';
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 101px; height: 187px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(candidate);
          target.style.cssText = 'display: block; width: 317px; height: 193px; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('101,187');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('101,187');
      expect(result[6]).assertEqual('101,187');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0050
     * @tc.name testEmbedNode0050
     * @tc.desc A renamed connected predecessor does not mask the new exact-id element: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'connectedPredecessor';
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 101px; height: 187px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(candidate);
          target.style.cssText = 'display: block; width: 317px; height: 193px; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('101,187');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('101,187');
      expect(result[6]).assertEqual('101,187');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0051
     * @tc.name testEmbedNode0051
     * @tc.desc A renamed connected predecessor does not mask the new exact-id element: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'connectedPredecessor';
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 101px; height: 187px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(candidate);
          target.style.cssText = 'display: block; width: 317px; height: 193px; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('101,187');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('101,187');
      expect(result[6]).assertEqual('101,187');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0052
     * @tc.name testEmbedNode0052
     * @tc.desc A renamed connected predecessor does not mask the new exact-id element: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          target.id = 'connectedPredecessor';
          const candidate = document.createElement('embed');
          candidate.setAttribute('type', 'native/component');
          candidate.setAttribute('src', 'view'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 101px; height: 187px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(candidate);
          target.style.cssText = 'display: block; width: 317px; height: 193px; padding: 0; border: 0;';
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
      expect(result[0]).assertEqual('101,187');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('101,187');
      expect(result[6]).assertEqual('101,187');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0053
     * @tc.name testEmbedNode0053
     * @tc.desc Removing an earlier duplicate promotes the intact current node: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 239px; height: 83px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.remove();
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
      expect(result[5]).assertEqual('239,83');
      expect(result[6]).assertEqual('239,83');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0054
     * @tc.name testEmbedNode0054
     * @tc.desc Removing an earlier duplicate promotes the intact current node: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 239px; height: 83px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.remove();
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
      expect(result[5]).assertEqual('239,83');
      expect(result[6]).assertEqual('239,83');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0055
     * @tc.name testEmbedNode0055
     * @tc.desc Removing an earlier duplicate promotes the intact current node: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 239px; height: 83px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.remove();
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
      expect(result[5]).assertEqual('239,83');
      expect(result[6]).assertEqual('239,83');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0056
     * @tc.name testEmbedNode0056
     * @tc.desc Removing an earlier duplicate promotes the intact current node: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 239px; height: 83px; padding: 0; border: 0;';
          side.appendChild(candidate);
          stage.insertBefore(candidate, target);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          candidate.remove();
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
      expect(result[5]).assertEqual('239,83');
      expect(result[6]).assertEqual('239,83');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0057
     * @tc.name testEmbedNode0057
     * @tc.desc Removing the current node promotes the later same-id div: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 149px; height: 157px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === candidate), String(nativeEmbed.nativeSearch === original),
            String(first.width + ',' + first.height), String(second.width + ',' + second.height),
            String(secondRect.width + ',' + secondRect.height),
            String(first !== second && first !== third && second !== third),
            String((third.width - current.clientWidth) + ',' + (third.height - current.clientHeight)),
            String(document.contains(original)), String(original.offsetWidth + ',' + original.offsetHeight)
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
      expect(result[0]).assertEqual('149,157');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('173,71');
      expect(result[6]).assertEqual('173,71');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('false');
      expect(result[10]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0058
     * @tc.name testEmbedNode0058
     * @tc.desc Removing the current node promotes the later same-id div: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 149px; height: 157px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.remove();
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
      expect(result[0]).assertEqual('149,157');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('141,57');
      expect(result[6]).assertEqual('141,57');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0059
     * @tc.name testEmbedNode0059
     * @tc.desc Removing the current node promotes the later same-id div: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 149px; height: 157px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.remove();
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
      expect(result[0]).assertEqual('149,157');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('211,97');
      expect(result[6]).assertEqual('211,97');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0060
     * @tc.name testEmbedNode0060
     * @tc.desc Removing the current node promotes the later same-id div: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 149px; height: 157px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          target.remove();
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
      expect(result[0]).assertEqual('149,157');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('83,137');
      expect(result[6]).assertEqual('83,137');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0061
     * @tc.name testEmbedNode0061
     * @tc.desc A nested earlier duplicate loses query priority when its ancestor is removed: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const nested = document.createElement('section'); stage.insertBefore(nested, target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 293px; height: 47px; padding: 0; border: 0;';
          nested.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          nested.remove();
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
      expect(result[5]).assertEqual('293,47');
      expect(result[6]).assertEqual('293,47');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0062
     * @tc.name testEmbedNode0062
     * @tc.desc A nested earlier duplicate loses query priority when its ancestor is removed: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const nested = document.createElement('section'); stage.insertBefore(nested, target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 293px; height: 47px; padding: 0; border: 0;';
          nested.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          nested.remove();
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
      expect(result[5]).assertEqual('293,47');
      expect(result[6]).assertEqual('293,47');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0063
     * @tc.name testEmbedNode0063
     * @tc.desc A nested earlier duplicate loses query priority when its ancestor is removed: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const nested = document.createElement('section'); stage.insertBefore(nested, target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 293px; height: 47px; padding: 0; border: 0;';
          nested.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          nested.remove();
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
      expect(result[5]).assertEqual('293,47');
      expect(result[6]).assertEqual('293,47');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0064
     * @tc.name testEmbedNode0064
     * @tc.desc A nested earlier duplicate loses query priority when its ancestor is removed: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const nested = document.createElement('section'); stage.insertBefore(nested, target);
          const candidate = document.createElement('div'); candidate.id = 'nativeSearch';
          candidate.style.cssText = 'display: block; width: 293px; height: 47px; padding: 0; border: 0;';
          nested.appendChild(candidate);
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          nested.remove();
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
      expect(result[5]).assertEqual('293,47');
      expect(result[6]).assertEqual('293,47');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0065
     * @tc.name testEmbedNode0065
     * @tc.desc Adopt the predecessor into another document while a same-id successor remains live: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 127px; height: 179px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const foreign = document.implementation.createHTMLDocument('other');
          foreign.body.appendChild(foreign.adoptNode(target));
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(document.adoptNode(target));
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
      expect(result[5]).assertEqual('127,179');
      expect(result[6]).assertEqual('127,179');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0066
     * @tc.name testEmbedNode0066
     * @tc.desc Adopt the predecessor into another document while a same-id successor remains live: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 127px; height: 179px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const foreign = document.implementation.createHTMLDocument('other');
          foreign.body.appendChild(foreign.adoptNode(target));
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(document.adoptNode(target));
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
      expect(result[5]).assertEqual('127,179');
      expect(result[6]).assertEqual('127,179');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0067
     * @tc.name testEmbedNode0067
     * @tc.desc Adopt the predecessor into another document while a same-id successor remains live: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 127px; height: 179px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const foreign = document.implementation.createHTMLDocument('other');
          foreign.body.appendChild(foreign.adoptNode(target));
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(document.adoptNode(target));
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
      expect(result[5]).assertEqual('127,179');
      expect(result[6]).assertEqual('127,179');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0068
     * @tc.name testEmbedNode0068
     * @tc.desc Adopt the predecessor into another document while a same-id successor remains live: live replacement
     * embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          candidate.style.cssText = 'display: block; width: 127px; height: 179px; padding: 0; border: 0;';
          side.appendChild(candidate);
          const foreign = document.implementation.createHTMLDocument('other');
          foreign.body.appendChild(foreign.adoptNode(target));
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          stage.appendChild(document.adoptNode(target));
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
      expect(result[5]).assertEqual('127,179');
      expect(result[6]).assertEqual('127,179');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0069
     * @tc.name testEmbedNode0069
     * @tc.desc Replace an ancestor with its clone, then restore the original subtree: cached embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const branch = stage.cloneNode(true); const candidate = branch.firstElementChild;
          candidate.style.cssText = 'display: block; width: 257px; height: 103px; padding: 0; border: 0;';
          side.appendChild(branch); stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          parent.insertBefore(stage, side); branch.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('173,71');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('173,71');
      expect(result[5]).assertEqual('257,103');
      expect(result[6]).assertEqual('257,103');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0070
     * @tc.name testEmbedNode0070
     * @tc.desc Replace an ancestor with its clone, then restore the original subtree: live padded div
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const branch = stage.cloneNode(true); const candidate = branch.firstElementChild;
          candidate.style.cssText = 'display: block; width: 257px; height: 103px; padding: 0; border: 0;';
          side.appendChild(branch); stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          parent.insertBefore(stage, side); branch.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('141,57');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('141,57');
      expect(result[5]).assertEqual('257,103');
      expect(result[6]).assertEqual('257,103');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0071
     * @tc.name testEmbedNode0071
     * @tc.desc Replace an ancestor with its clone, then restore the original subtree: live border-box span
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const branch = stage.cloneNode(true); const candidate = branch.firstElementChild;
          candidate.style.cssText = 'display: block; width: 257px; height: 103px; padding: 0; border: 0;';
          side.appendChild(branch); stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          parent.insertBefore(stage, side); branch.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('211,97');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('211,97');
      expect(result[5]).assertEqual('257,103');
      expect(result[6]).assertEqual('257,103');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });

    /**
     * @tc.number ARKWEB_EMBED_NODE_0072
     * @tc.name testEmbedNode0072
     * @tc.desc Replace an ancestor with its clone, then restore the original subtree: live replacement embed
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testEmbedNode0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
          const branch = stage.cloneNode(true); const candidate = branch.firstElementChild;
          candidate.style.cssText = 'display: block; width: 257px; height: 103px; padding: 0; border: 0;';
          side.appendChild(branch); stage.remove();
          const second = getEmbedSize();
          const secondNode = document.getElementById('nativeSearch');
          const secondRect = secondNode.getBoundingClientRect();
          const cloneEvidence = secondNode.firstElementChild !== marker &&
            secondNode.firstElementChild.textContent === 'retained child';
          parent.insertBefore(stage, side); branch.remove();
          const third = getEmbedSize();
          const current = document.getElementById('nativeSearch'); const rect = current.getBoundingClientRect();
          return JSON.stringify([
            String(third.width + ',' + third.height), String(rect.width + ',' + rect.height),
            String(current === target), String(nativeEmbed.nativeSearch === original),
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
      expect(result[0]).assertEqual('83,137');
      expect(result[1]).assertEqual(result[0]);
      expect(result[2]).assertEqual('true');
      expect(result[3]).assertEqual('true');
      expect(result[4]).assertEqual('83,137');
      expect(result[5]).assertEqual('257,103');
      expect(result[6]).assertEqual('257,103');
      expect(result[7]).assertEqual('true');
      expect(result[8]).assertEqual('0,0');
      expect(result[9]).assertEqual('true');
    });
  });
}
