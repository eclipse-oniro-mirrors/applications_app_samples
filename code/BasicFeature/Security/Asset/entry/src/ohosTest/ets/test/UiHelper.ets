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

import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { inputMethod } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';

const BUNDLE_NAME: string = 'com.example.asset_sample';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

/**
 * 延时等待，供 UI 渲染与转场使用。
 */
export function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

/**
 * 启动主应用 EntryAbility（幂等，失败仅记录日志）。
 */
export async function launchApp(): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s', 'launchApp begin');
  try {
    await abilityDelegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: 'EntryAbility'
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'launchApp catch: %{public}s', JSON.stringify(err));
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'launchApp end');
}

/**
 * 按 id 定位组件，未找到时返回 null。
 */
export async function findId(driver: Driver, id: string): Promise<Component> {
  return await driver.findComponent(ON.id(id));
}

/**
 * 按 id 点击组件：轮询等待组件出现（页面转场/渲染期间组件可能暂不可见），
 * 超时仍未出现则抛出带 id 的错误，便于定位 click of null 的具体组件。
 */
export async function clickId(driver: Driver, id: string): Promise<void> {
  const comp: Component | null = await waitForId(driver, id, 5000);
  if (comp === null) {
    hilog.error(DOMAIN, TAG, 'clickId not found: %{public}s', id);
    throw new Error('clickId not found: ' + id);
  }
  await comp.click();
}

/**
 * 按 id 向输入框写入文本。
 */
export async function inputById(driver: Driver, id: string, text: string): Promise<void> {
  const comp: Component = await driver.findComponent(ON.id(id));
  await comp.inputText(text);
}

/**
 * 收起输入法会话（失败仅记录日志）。
 */
export function stopInput(): void {
  try {
    inputMethod.getController().stopInputSession();
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'stopInput catch: %{public}s', JSON.stringify(err));
  }
}

/**
 * 轮询等待组件出现，超时返回 null（driver.findComponent 运行时可能返回 null）。
 */
export async function waitForId(driver: Driver, id: string, timeoutMs: number): Promise<Component | null> {
  const start: number = Date.now();
  while (Date.now() - start < timeoutMs) {
    const comp: Component = await driver.findComponent(ON.id(id));
    if (comp !== null) {
      return comp;
    }
    await sleep(400);
  }
  return await findId(driver, id);
}

/**
 * 清空查询页两个输入框：触发 onChange 清空 @State，避免用例间输入残留
 * 把后续查询带入账号精确查询分支（preQuery 空挑战不跳转）。
 * 末尾收起软键盘：clearText 会聚焦输入框弹出键盘，键盘压缩可视区后
 * Scroll 底部 search 按钮被挤出屏幕，findComponent 只找屏内组件会失败
 * （实测探针 qAcct=Y 而 search=N），收起键盘后 search 恢复可见。
 */
export async function clearQueryInputs(driver: Driver): Promise<void> {
  const account: Component = await findId(driver, 'query_account_input');
  if (account !== null) {
    try {
      await account.clearText();
    } catch (err) {
      hilog.info(DOMAIN, TAG, 'clearText account catch: %{public}s', JSON.stringify(err));
    }
  }
  const label: Component = await findId(driver, 'query_label_input');
  if (label !== null) {
    try {
      await label.clearText();
    } catch (err) {
      hilog.info(DOMAIN, TAG, 'clearText label catch: %{public}s', JSON.stringify(err));
    }
  }
  await sleep(400);
  stopInput();
  await sleep(800);
}

/**
 * 在保存页写入一条种子资产（幂等：账号已存在时保存失败但旧资产仍在，查询仍可命中）。
 * 写入前先清空三输入框：保存页 @State 在用例间残留，inputText 是追加写入，不清空会拼接。
 */
export async function saveAssetSeed(driver: Driver, account: string, secret: string, label: string): Promise<void> {
  await switchTab(driver, 0);
  const acct: Component = await findId(driver, 'account_input');
  if (acct !== null) {
    try {
      await acct.clearText();
    } catch (err) {
      const be: BusinessError = err as BusinessError;
      hilog.info(DOMAIN, TAG, 'clearText seed account catch: %{public}s', JSON.stringify(be.message));
    }
  }
  const sec: Component = await findId(driver, 'secret_input');
  if (sec !== null) {
    try {
      await sec.clearText();
    } catch (err) {
      const be: BusinessError = err as BusinessError;
      hilog.info(DOMAIN, TAG, 'clearText seed secret catch: %{public}s', JSON.stringify(be.message));
    }
  }
  const lbl: Component = await findId(driver, 'label_input');
  if (lbl !== null) {
    try {
      await lbl.clearText();
    } catch (err) {
      const be: BusinessError = err as BusinessError;
      hilog.info(DOMAIN, TAG, 'clearText seed label catch: %{public}s', JSON.stringify(be.message));
    }
  }
  await sleep(400);
  await inputById(driver, 'account_input', account);
  await inputById(driver, 'secret_input', secret);
  await inputById(driver, 'label_input', label);
  stopInput();
  await sleep(800);
  await clickId(driver, 'save');
  await sleep(1200);
}

/**
 * 点击查询并等待结果列表出现：标签查询需 4 次 asset.query 较慢，轮询给足 8s；
 * 超时后区分两种情况：页面仍在查询页（点击被键盘遮挡）则收起输入法重试，
 * 页面已跳转则继续等待列表渲染。
 */
export async function searchAndWaitResult(driver: Driver): Promise<Component> {
  await clickId(driver, 'search');
  const first: Component | null = await waitForId(driver, 'result_list', 8000);
  if (first !== null) {
    return first;
  }
  const stillSearch: Component = await findId(driver, 'search');
  if (stillSearch !== null) {
    stopInput();
    await sleep(800);
    await clickId(driver, 'search');
  }
  const waited: Component | null = await waitForId(driver, 'result_list', 10000);
  if (waited !== null) {
    return waited;
  }
  // 兜底：与 findId 声明一致（运行时可能为 null，由调用方断言处理）
  return await findId(driver, 'result_list');
}

/**
 * 回到主页面保存 tab：以 tab_bar_0 可见性作为“已回主页”判据。
 * 用例间页面状态会累积（跳转结果/更新页后主页面 tab 不可见），switchTab 前必须先复位。
 * 返回只点一次并等待主页出现：返回转场期间 back_button 仍在，按存在性循环会连点把主页也退掉。
 */
export async function backToHome(driver: Driver): Promise<void> {
  const tab0: Component | null = await waitForId(driver, 'tab_bar_0', 2000);
  if (tab0 !== null) {
    await tab0.click();
    // tab 切换转场动画未完成时后续点击会被吞（实测 click tab0 后立即 clickId(tab_bar_3)
    // 落在转场中无效，页面停在保存页导致 search 找不到），等转场完成再返回
    await sleep(1200);
    return;
  }
  const back: Component = await findId(driver, 'back_button');
  if (back !== null) {
    await back.click();
    const home: Component | null = await waitForId(driver, 'tab_bar_0', 8000);
    if (home !== null) {
      await home.click();
      await sleep(1200);
    }
  }
}

/**
 * 结果页点击返回并等待查询页 search 按钮出现：消除 back 转场竞态。
 */
export async function backToQuery(driver: Driver): Promise<void> {
  await clickId(driver, 'back_button');
  await waitForId(driver, 'search', 8000);
}

/**
 * 点击底部 Tab 文本并等待页面渲染。
 */
export async function switchTab(driver: Driver, index: number): Promise<void> {
  await backToHome(driver);
  await clickId(driver, 'tab_bar_' + index);
  await sleep(1200);
  // 切入查询页时清空输入残留：账号输入会把查询带入精确查询分支（preQuery 空挑战不跳转）
  if (index === 3) {
    await clearQueryInputs(driver);
  }
}
