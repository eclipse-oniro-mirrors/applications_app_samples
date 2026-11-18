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

import { Driver, ON, Component } from '@ohos.UiTest';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { PRODUCT_DATA } from '../../../../main/ets/mock/GoodsMock';
import { ProductDataModel } from '../../../../main/ets/model/GoodsModel';

let sharedDriver: Driver | undefined = undefined;
let operationQueue: Promise<void> = Promise.resolve();
let renderingAppStarted: boolean = false;
export const PAGE_TIMEOUT_MS: number = 15000;
export const POLL_INTERVAL_MS: number = 100;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

// Preserve the reference Promise queue. Never enqueue from inside an action.
// A rejected operation rejects its caller and does not poison the next action.
export async function runSerializedUiOperation<T>(
  action: () => Promise<T>,
): Promise<T> {
  const result: Promise<T> = operationQueue.then(action);
  operationQueue = result.then(
    (): void => {},
    (): void => {},
  );
  return result;
}

export function getDriver(): Driver {
  if (sharedDriver === undefined) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export async function serializedDelay(
  driver: Driver,
  delayMs: number,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(
  driver: Driver,
  key: number,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.triggerKey(key);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  delayMs: number = POLL_INTERVAL_MS,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function launchRenderingApp(): Promise<void> {
  if (renderingAppStarted) {
    return;
  }
  const delegator = registry.getAbilityDelegator();
  const args = registry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility',
    moduleName: 'entry',
  };
  const result = await delegator.executeShellCommand(
    'aa start -b ' + args.bundleName + ' -a EntryAbility -m entry',
    10,
  );
  if (!result.stdResult.includes('start ability successfully')) {
    throw new Error('EntryAbility shell launch failed: ' + result.stdResult);
  }
  renderingAppStarted = true;
}

export async function findComponentsByType(
  driver: Driver,
  type: string,
): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    return (await driver.findComponents(ON.type(type))) ?? [];
  });
}

export async function checkTextContent(
  driver: Driver,
  expectedText: string,
): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const matches = await driver.findComponents(
      ON.text(expectedText),
    );
    return (
      matches !== undefined && matches !== null && matches.length > 0
    );
  });
}

export async function waitForRenderingStable(
  driver: Driver,
): Promise<void> {
  const title: string = resolveString(
    $r('app.string.nativeembed_mall'),
  );
  const deadline: number = Date.now() + PAGE_TIMEOUT_MS;
  while (Date.now() < deadline) {
    const grids = await findComponentsByType(driver, 'Grid');
    const webs = await findComponentsByType(driver, 'Web');
    if (grids.length > 0 && webs.length === 1) {
      return;
    }
    await serializedDelay(driver, POLL_INTERVAL_MS);
  }
  throw new Error(
    'Native overlay was not rendered before the deadline',
  );
}

export async function simulateTouch(
  driver: Driver,
  x: number,
  y: number,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(x, y);
  });
}

export async function clickText(
  driver: Driver,
  text: string,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component = await driver.findComponent(ON.text(text));
    if (component === null || component === undefined) {
      throw new Error('Required text component was not found');
    }
    await component.click();
  });
}

export function resolveString(value: ResourceStr): string {
  if (typeof value === 'string') {
    return value;
  }
  const manager = registry
    .getAbilityDelegator()
    .getAppContext().createModuleContext('entry_test').resourceManager;
  return manager.getStringSync(value.id);
}

export async function assertImageResource(
  value: ResourceStr,
): Promise<void> {
  if (typeof value === 'string') {
    throw new Error(
      'Catalog images must reference packaged media resources',
    );
  }
  const manager = registry
    .getAbilityDelegator()
    .getAppContext().createModuleContext('entry_test').resourceManager;
  const bytes: Uint8Array = await manager.getMediaContent(value.id);
  const length: number = bytes.length;
  expect(length).assertLarger(0);
}

export function catalogSnapshot(): ProductDataModel[] {
  return PRODUCT_DATA.map(
    (item: ProductDataModel): ProductDataModel => {
      return new ProductDataModel(
        item.id,
        item.uri,
        item.title,
        item.price,
      );
    },
  );
}

export async function yieldToLifecycle(): Promise<void> {
  await new Promise<void>((resolve) => {
    setTimeout(resolve, 10);
  });
}

export function assertCatalogUnchanged(
  snapshot: ProductDataModel[],
): void {
  const count: number = PRODUCT_DATA.length;
  expect(count).assertEqual(snapshot.length);
  for (let index: number = 0; index < snapshot.length; index++) {
    const expected: ProductDataModel = snapshot[index];
    const actual: ProductDataModel = PRODUCT_DATA[index];
    expect(actual.id).assertEqual(expected.id);
    expect(actual.uri).assertEqual(expected.uri);
    expect(actual.title).assertEqual(expected.title);
    expect(actual.price).assertEqual(expected.price);
  }
}

export function logSuite(suite: string, event: string): void {
  hilog.info(
    0x0000,
    'RenderingTest',
    '%{public}s %{public}s',
    suite,
    event,
  );
}

// Read the actual catalog entry at position 0; no generated replacement model.
export function catalogEntry00(): ProductDataModel {
  return PRODUCT_DATA[0];
}

export function catalogTitle00(): string {
  return resolveString(catalogEntry00().title);
}

export function catalogPrice00(): string {
  return resolveString(catalogEntry00().price);
}

export async function catalogImage00(): Promise<void> {
  await assertImageResource(catalogEntry00().uri);
}

export function catalogCopy00(): ProductDataModel {
  const item: ProductDataModel = catalogEntry00();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 1; no generated replacement model.
export function catalogEntry01(): ProductDataModel {
  return PRODUCT_DATA[1];
}

export function catalogTitle01(): string {
  return resolveString(catalogEntry01().title);
}

export function catalogPrice01(): string {
  return resolveString(catalogEntry01().price);
}

export async function catalogImage01(): Promise<void> {
  await assertImageResource(catalogEntry01().uri);
}

export function catalogCopy01(): ProductDataModel {
  const item: ProductDataModel = catalogEntry01();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 2; no generated replacement model.
export function catalogEntry02(): ProductDataModel {
  return PRODUCT_DATA[2];
}

export function catalogTitle02(): string {
  return resolveString(catalogEntry02().title);
}

export function catalogPrice02(): string {
  return resolveString(catalogEntry02().price);
}

export async function catalogImage02(): Promise<void> {
  await assertImageResource(catalogEntry02().uri);
}

export function catalogCopy02(): ProductDataModel {
  const item: ProductDataModel = catalogEntry02();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 3; no generated replacement model.
export function catalogEntry03(): ProductDataModel {
  return PRODUCT_DATA[3];
}

export function catalogTitle03(): string {
  return resolveString(catalogEntry03().title);
}

export function catalogPrice03(): string {
  return resolveString(catalogEntry03().price);
}

export async function catalogImage03(): Promise<void> {
  await assertImageResource(catalogEntry03().uri);
}

export function catalogCopy03(): ProductDataModel {
  const item: ProductDataModel = catalogEntry03();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 4; no generated replacement model.
export function catalogEntry04(): ProductDataModel {
  return PRODUCT_DATA[4];
}

export function catalogTitle04(): string {
  return resolveString(catalogEntry04().title);
}

export function catalogPrice04(): string {
  return resolveString(catalogEntry04().price);
}

export async function catalogImage04(): Promise<void> {
  await assertImageResource(catalogEntry04().uri);
}

export function catalogCopy04(): ProductDataModel {
  const item: ProductDataModel = catalogEntry04();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 5; no generated replacement model.
export function catalogEntry05(): ProductDataModel {
  return PRODUCT_DATA[5];
}

export function catalogTitle05(): string {
  return resolveString(catalogEntry05().title);
}

export function catalogPrice05(): string {
  return resolveString(catalogEntry05().price);
}

export async function catalogImage05(): Promise<void> {
  await assertImageResource(catalogEntry05().uri);
}

export function catalogCopy05(): ProductDataModel {
  const item: ProductDataModel = catalogEntry05();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 6; no generated replacement model.
export function catalogEntry06(): ProductDataModel {
  return PRODUCT_DATA[6];
}

export function catalogTitle06(): string {
  return resolveString(catalogEntry06().title);
}

export function catalogPrice06(): string {
  return resolveString(catalogEntry06().price);
}

export async function catalogImage06(): Promise<void> {
  await assertImageResource(catalogEntry06().uri);
}

export function catalogCopy06(): ProductDataModel {
  const item: ProductDataModel = catalogEntry06();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 7; no generated replacement model.
export function catalogEntry07(): ProductDataModel {
  return PRODUCT_DATA[7];
}

export function catalogTitle07(): string {
  return resolveString(catalogEntry07().title);
}

export function catalogPrice07(): string {
  return resolveString(catalogEntry07().price);
}

export async function catalogImage07(): Promise<void> {
  await assertImageResource(catalogEntry07().uri);
}

export function catalogCopy07(): ProductDataModel {
  const item: ProductDataModel = catalogEntry07();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 8; no generated replacement model.
export function catalogEntry08(): ProductDataModel {
  return PRODUCT_DATA[8];
}

export function catalogTitle08(): string {
  return resolveString(catalogEntry08().title);
}

export function catalogPrice08(): string {
  return resolveString(catalogEntry08().price);
}

export async function catalogImage08(): Promise<void> {
  await assertImageResource(catalogEntry08().uri);
}

export function catalogCopy08(): ProductDataModel {
  const item: ProductDataModel = catalogEntry08();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 9; no generated replacement model.
export function catalogEntry09(): ProductDataModel {
  return PRODUCT_DATA[9];
}

export function catalogTitle09(): string {
  return resolveString(catalogEntry09().title);
}

export function catalogPrice09(): string {
  return resolveString(catalogEntry09().price);
}

export async function catalogImage09(): Promise<void> {
  await assertImageResource(catalogEntry09().uri);
}

export function catalogCopy09(): ProductDataModel {
  const item: ProductDataModel = catalogEntry09();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 10; no generated replacement model.
export function catalogEntry10(): ProductDataModel {
  return PRODUCT_DATA[10];
}

export function catalogTitle10(): string {
  return resolveString(catalogEntry10().title);
}

export function catalogPrice10(): string {
  return resolveString(catalogEntry10().price);
}

export async function catalogImage10(): Promise<void> {
  await assertImageResource(catalogEntry10().uri);
}

export function catalogCopy10(): ProductDataModel {
  const item: ProductDataModel = catalogEntry10();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 11; no generated replacement model.
export function catalogEntry11(): ProductDataModel {
  return PRODUCT_DATA[11];
}

export function catalogTitle11(): string {
  return resolveString(catalogEntry11().title);
}

export function catalogPrice11(): string {
  return resolveString(catalogEntry11().price);
}

export async function catalogImage11(): Promise<void> {
  await assertImageResource(catalogEntry11().uri);
}

export function catalogCopy11(): ProductDataModel {
  const item: ProductDataModel = catalogEntry11();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 12; no generated replacement model.
export function catalogEntry12(): ProductDataModel {
  return PRODUCT_DATA[12];
}

export function catalogTitle12(): string {
  return resolveString(catalogEntry12().title);
}

export function catalogPrice12(): string {
  return resolveString(catalogEntry12().price);
}

export async function catalogImage12(): Promise<void> {
  await assertImageResource(catalogEntry12().uri);
}

export function catalogCopy12(): ProductDataModel {
  const item: ProductDataModel = catalogEntry12();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 13; no generated replacement model.
export function catalogEntry13(): ProductDataModel {
  return PRODUCT_DATA[13];
}

export function catalogTitle13(): string {
  return resolveString(catalogEntry13().title);
}

export function catalogPrice13(): string {
  return resolveString(catalogEntry13().price);
}

export async function catalogImage13(): Promise<void> {
  await assertImageResource(catalogEntry13().uri);
}

export function catalogCopy13(): ProductDataModel {
  const item: ProductDataModel = catalogEntry13();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 14; no generated replacement model.
export function catalogEntry14(): ProductDataModel {
  return PRODUCT_DATA[14];
}

export function catalogTitle14(): string {
  return resolveString(catalogEntry14().title);
}

export function catalogPrice14(): string {
  return resolveString(catalogEntry14().price);
}

export async function catalogImage14(): Promise<void> {
  await assertImageResource(catalogEntry14().uri);
}

export function catalogCopy14(): ProductDataModel {
  const item: ProductDataModel = catalogEntry14();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}

// Read the actual catalog entry at position 15; no generated replacement model.
export function catalogEntry15(): ProductDataModel {
  return PRODUCT_DATA[15];
}

export function catalogTitle15(): string {
  return resolveString(catalogEntry15().title);
}

export function catalogPrice15(): string {
  return resolveString(catalogEntry15().price);
}

export async function catalogImage15(): Promise<void> {
  await assertImageResource(catalogEntry15().uri);
}

export function catalogCopy15(): ProductDataModel {
  const item: ProductDataModel = catalogEntry15();
  return new ProductDataModel(
    item.id,
    item.uri,
    item.title,
    item.price,
  );
}
