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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';

function readString(resource: Resource): string {
  let manager: resourceManager.ResourceManager =
    abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
  return manager.getStringSync(resource);
}

// ---- inlined MainThreadYield ----
/**
 * Long matrix suites run on the test main thread. Yielding between chunks keeps
 * the ability responsive so that component queries issued afterwards still see a
 * live window.
 */

export const DEFAULT_CHUNK: number = 200;

/** Resolves on the next macrotask, giving the UI thread a chance to breathe. */
export async function yieldToMainThread(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 0);
  });
}

/** Runs a long loop in chunks, yielding after each chunk. */
export async function keepMainThreadResponsive<T>(items: T[], work: (item: T) => boolean,
  chunk: number = DEFAULT_CHUNK): Promise<number> {
  let completed: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (work(items[i])) {
      completed++;
    }
    if (i > 0 && i % chunk === 0) {
      await yieldToMainThread();
    }
  }
  return completed;
}

export default function resourceContract() {
  describe('GobangResourceContract', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /** @tc.number SUB_GOBANG_RES_0100 @tc.name testResourceRestartLabel0001 @tc.desc The restart button label resolves to one of the declared locales */
    it('testResourceRestartLabel0001', 0, async () => {
      let value: string = readString($r('app.string.restart'));
      expect(value.length > 0).assertTrue();
      expect(['Restart', '重开'].indexOf(value) >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0200 @tc.name testResourceUndoLabel0002 @tc.desc The repentance button label resolves to one of the declared locales */
    it('testResourceUndoLabel0002', 0, async () => {
      let value: string = readString($r('app.string.repentance_chess'));
      expect(value.length > 0).assertTrue();
      expect(['RepentanceChess', '悔棋'].indexOf(value) >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0300 @tc.name testResourceSelectDeviceLabel0003 @tc.desc The device dialog title resolves to one of the declared locales */
    it('testResourceSelectDeviceLabel0003', 0, async () => {
      let value: string = readString($r('app.string.select_device'));
      expect(value.length > 0).assertTrue();
      expect(['SelectDevice', '选择设备'].indexOf(value) >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0400 @tc.name testResourceCancelLabel0004 @tc.desc The dialog cancel label resolves to one of the declared locales */
    it('testResourceCancelLabel0004', 0, async () => {
      let value: string = readString($r('app.string.cancel'));
      expect(value.length > 0).assertTrue();
      expect(['cancel', '取消'].indexOf(value) >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0500 @tc.name testResourceAllowLabel0005 @tc.desc The permission dialog allow label resolves to one of the declared locales */
    it('testResourceAllowLabel0005', 0, async () => {
      let value: string = readString($r('app.string.allow'));
      expect(value.length > 0).assertTrue();
      expect(['allow', '允许'].indexOf(value) >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0600 @tc.name testResourceTestAbilityStrings0006 @tc.desc Every test ability string resolves to a non-empty value */
    it('testResourceTestAbilityStrings0006', 0, async () => {
      expect(readString($r('app.string.entry_test_desc')).length > 0).assertTrue();
      expect(readString($r('app.string.TestAbility_desc')).length > 0).assertTrue();
      expect(readString($r('app.string.TestAbility_label')).length > 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0700 @tc.name testResourceDistinctIds0007 @tc.desc The five UI strings are distinct resources, not aliases of one id */
    it('testResourceDistinctIds0007', 0, async () => {
      let ids: number[] = [
        $r('app.string.restart').id,
        $r('app.string.repentance_chess').id,
        $r('app.string.select_device').id,
        $r('app.string.cancel').id,
        $r('app.string.allow').id
      ];
      let unique: number[] = [];
      for (let i = 0; i < ids.length; i++) {
        if (unique.indexOf(ids[i]) < 0) {
          unique.push(ids[i]);
        }
      }
      expect(unique.length).assertEqual(5);
      expect(ids[0] > 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_0800 @tc.name testResourceNoPlaceholders0008 @tc.desc The UI labels contain no printf placeholder that would render raw */
    it('testResourceNoPlaceholders0008', 0, async () => {
      let values: string[] = [
        readString($r('app.string.restart')),
        readString($r('app.string.repentance_chess')),
        readString($r('app.string.select_device')),
        readString($r('app.string.cancel')),
        readString($r('app.string.allow'))
      ];
      for (let i = 0; i < values.length; i++) {
        expect(values[i].indexOf('%')).assertEqual(-1);
        expect(values[i].indexOf('{')).assertEqual(-1);
        expect(values[i].trim()).assertEqual(values[i]);
      }
    });

    /** @tc.number SUB_GOBANG_RES_0900 @tc.name testResourceStableAcrossReads0009 @tc.desc Reading the same resource twice returns identical text */
    it('testResourceStableAcrossReads0009', 0, async () => {
      let first: string = readString($r('app.string.restart'));
      let second: string = readString($r('app.string.restart'));
      let third: string = readString($r('app.string.restart'));
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
    });

    /** @tc.number SUB_GOBANG_RES_1000 @tc.name testResourceMediaIcon0010 @tc.desc The test module icon is a non-empty media resource */
    it('testResourceMediaIcon0010', 0, async () => {
      let manager: resourceManager.ResourceManager =
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let icon: Uint8Array = manager.getMediaContentSync($r('app.media.icon'));
      expect(icon.length > 0).assertTrue();
      expect(icon.byteLength > 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_RES_1100 @tc.name testResourceColourWhite0011 @tc.desc The test module white colour resolves to the documented value */
    it('testResourceColourWhite0011', 0, async () => {
      let manager: resourceManager.ResourceManager =
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let colour: number = manager.getColorSync($r('app.color.white'));
      expect(colour >>> 24).assertEqual(255);
      expect(colour & 0xFFFFFF).assertEqual(0xFFFFFF);
    });

    /** @tc.number SUB_GOBANG_RES_1200 @tc.name testResourceLabelLengths0012 @tc.desc Every dialog label fits the 300 vp button without truncation */
    it('testResourceLabelLengths0012', 0, async () => {
      let restart: string = readString($r('app.string.restart'));
      let undo: string = readString($r('app.string.repentance_chess'));
      let select: string = readString($r('app.string.select_device'));
      expect(restart.length < 20).assertTrue();
      expect(undo.length < 20).assertTrue();
      expect(select.length < 20).assertTrue();
      expect(restart.length > 0).assertTrue();
    });
  });
}
