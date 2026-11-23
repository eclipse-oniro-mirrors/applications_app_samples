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

import { UIAbility } from '@kit.AbilityKit';
import { ComponentContent, UIContext } from '@kit.ArkUI';
import { util } from '@kit.ArkTS';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { BUNDLE_NAME, ENTRY_ABILITY, ENTRY_MODULE } from './shared/Probe';
import { logCase } from './shared/TestLog';

const READY_TIMEOUT_MS: number = 5000;
const RECORD_REGISTRATION: string = `(() => {
  const original = Element.prototype.addEventListener;
  window.__embedProbeAddEventListener = original;
  window.__embedProbeRegistrations = [];
  Element.prototype.addEventListener = function(type, listener, options) {
    if (this.id === 'nativeSearch' && type === 'touchstart') {
      window.__embedProbeRegistrations.push({ target: this, type, listener, options });
    }
    return original.call(this, type, listener, options);
  };
})();`;

const CAPTURE_DOCUMENT: string = `(() => {
  const element = document.getElementById('nativeSearch');
  window.__embedProbeOriginal = element;
  window.__embedProbeParent = element.parentNode;
  window.__embedProbeNext = element.nextSibling;
  window.__embedProbeEvents = nativeEmbed.events;
  window.__embedProbeEventDescriptors = Object.getOwnPropertyDescriptors(nativeEmbed.events);
  window.__embedProbeTree = [...document.querySelectorAll('*')].map(node => ({
    node,
    attributes: [...node.attributes].map(attribute => [attribute.name, attribute.value]),
    children: [...node.childNodes]
  }));
  return 'captured';
})();`;

const RESTORE_DOCUMENT: string = `(() => {
  const original = window.__embedProbeOriginal;
  const baseline = window.__embedProbeRegistrations[0];
  for (const registration of window.__embedProbeRegistrations.slice(1)) {
    registration.target.removeEventListener(registration.type, registration.listener, registration.options);
  }
  for (const entry of window.__embedProbeTree) {
    const node = entry.node;
    for (const attribute of [...node.attributes]) {
      if (!entry.attributes.some(saved => saved[0] === attribute.name)) {
        node.removeAttribute(attribute.name);
      }
    }
    for (const attribute of entry.attributes) {
      if (node.getAttribute(attribute[0]) !== attribute[1]) {
        node.setAttribute(attribute[0], attribute[1]);
      }
    }
    if (node.childNodes.length !== entry.children.length ||
        entry.children.some((child, index) => node.childNodes[index] !== child)) {
      node.replaceChildren(...entry.children);
    }
  }
  nativeEmbed.nativeSearch = original;
  nativeEmbed.events = window.__embedProbeEvents;
  for (const key of Reflect.ownKeys(nativeEmbed.events)) {
    if (!Object.prototype.hasOwnProperty.call(window.__embedProbeEventDescriptors, key)) {
      delete nativeEmbed.events[key];
    }
  }
  Object.defineProperties(nativeEmbed.events, window.__embedProbeEventDescriptors);
  window.__embedProbeAddEventListener.call(original, baseline.type, baseline.listener, baseline.options);
  window.__embedProbeRegistrations.splice(1);
  return 'restored';
})();`;

interface DocumentReady {
  matchesTitle: boolean;
  hasEmbed: boolean;
}

async function withinDeadline<T>(work: Promise<T>, message: string): Promise<T> {
  let timer: number = 0;
  const timeout: Promise<T> = new Promise<T>((resolve, reject) => {
    timer = setTimeout(() => {
      reject(new Error(message));
    }, READY_TIMEOUT_MS);
  });
  try {
    return await Promise.race([work, timeout]);
  } finally {
    clearTimeout(timer);
  }
}

class EmbedWebState {
  controller: webview.WebviewController = new webview.WebviewController();
  ready: Promise<void>;
  resolveReady: () => void = () => {};
  rejectReady: (error: Error) => void = () => {};
  encodedHtml: string;
  isCapturing: boolean = false;

  constructor(encodedHtml: string) {
    this.encodedHtml = encodedHtml;
    this.ready = new Promise<void>((resolve, reject) => {
      this.resolveReady = resolve;
      this.rejectReady = reject;
    });
  }

  pageEnd(): void {
    if (this.isCapturing) {
      return;
    }
    const script: string = `JSON.stringify({
      matchesTitle: document.title === 'viewhtml',
      hasEmbed: document.getElementById('nativeSearch') !== null
    })`;
    this.controller.runJavaScript(script).then((result: string) => {
      const documentResult: string = JSON.parse(result) as string;
      logCase('EmbedDocumentHost', documentResult);
      const ready: DocumentReady = JSON.parse(documentResult) as DocumentReady;
      if (!ready.matchesTitle) {
        return;
      }
      if (!ready.hasEmbed) {
        this.rejectReady(new Error('The original HTML did not create nativeSearch'));
        return;
      }
      this.isCapturing = true;
      this.controller.runJavaScript(CAPTURE_DOCUMENT).then(() => {
        this.resolveReady();
      }, (error: Error) => {
        this.rejectReady(error);
      });
    }).catch((error: Error) => {
      this.rejectReady(error);
    });
  }
}

@Builder
function embedDocumentBuilder(state: EmbedWebState) {
  Web({ src: 'data:text/html;base64,' + state.encodedHtml, controller: state.controller })
    .width(320)
    .height(240)
    .enableNativeEmbedMode(true)
    .javaScriptOnDocumentStart([{ script: RECORD_REGISTRATION, scriptRules: ['*'] }])
    .onPageEnd(() => {
      state.pageEnd();
    })
}

function isHome(ability: UIAbility): boolean {
  return ability.context.abilityInfo.bundleName === BUNDLE_NAME &&
    ability.context.abilityInfo.moduleName === ENTRY_MODULE &&
    ability.context.abilityInfo.name === ENTRY_ABILITY;
}

export class EmbedDocumentHost {
  private uiContext: UIContext | undefined = undefined;
  private content: ComponentContent<EmbedWebState> | undefined = undefined;
  private state: EmbedWebState | undefined = undefined;
  private ownedAbility: UIAbility | undefined = undefined;

  async open(): Promise<void> {
    if (this.state !== undefined) {
      await this.state.ready;
      return;
    }
    try {
      const ability: UIAbility = await this.homeAbility();
      const title: string = ability.context.resourceManager.getStringByNameSync('embed_product_title000');
      await Driver.create().waitForComponent(ON.text(title), READY_TIMEOUT_MS);
      const uiContext: UIContext = ability.context.windowStage.getMainWindowSync().getUIContext();
      const html: Uint8Array = ability.context.resourceManager.getRawFileContentSync('embed_view.html');
      const encoded: string = new util.Base64Helper().encodeToStringSync(html);
      const state: EmbedWebState = new EmbedWebState(encoded);
      this.uiContext = uiContext;
      this.state = state;
      uiContext.runScopedTask(() => {
        const content: ComponentContent<EmbedWebState> =
          new ComponentContent(uiContext, wrapBuilder(embedDocumentBuilder), state);
        this.content = content;
        uiContext.getOverlayManager().addComponentContent(content);
      });
      await withinDeadline(state.ready, 'The original embed document did not finish loading');
    } catch (error) {
      await this.close();
      throw error as Error;
    }
  }

  async reset(): Promise<void> {
    await this.run(RESTORE_DOCUMENT);
  }

  async run(script: string): Promise<string> {
    const state: EmbedWebState | undefined = this.state;
    if (state === undefined) {
      throw new Error('The embed document host is not open');
    }
    const result: string = await withinDeadline(state.controller.runJavaScript(script),
      'The embed document script did not finish');
    return JSON.parse(result) as string;
  }

  async close(): Promise<void> {
    const uiContext: UIContext | undefined = this.uiContext;
    const content: ComponentContent<EmbedWebState> | undefined = this.content;
    const ownedAbility: UIAbility | undefined = this.ownedAbility;
    this.content = undefined;
    this.state = undefined;
    this.uiContext = undefined;
    this.ownedAbility = undefined;
    try {
      if (uiContext !== undefined && content !== undefined) {
        uiContext.runScopedTask(() => {
          try {
            uiContext.getOverlayManager().removeComponentContent(content);
          } finally {
            content.dispose();
          }
        });
      }
    } finally {
      if (ownedAbility !== undefined) {
        await ownedAbility.context.terminateSelf();
      }
    }
  }

  private async homeAbility(): Promise<UIAbility> {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let top: UIAbility | undefined = undefined;
    try {
      top = await delegator.getCurrentTopAbility();
    } catch (error) {
      top = undefined;
    }
    if (top !== undefined && isHome(top)) {
      return top;
    }
    let resolveStage: (ability: UIAbility) => void = () => {};
    const stageReady: Promise<UIAbility> = new Promise<UIAbility>((resolve) => {
      resolveStage = resolve;
    });
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: ENTRY_ABILITY,
      moduleName: ENTRY_MODULE,
      onWindowStageCreate: (ability: UIAbility) => {
        if (isHome(ability)) {
          this.ownedAbility = ability;
          resolveStage(ability);
        }
      }
    };
    await delegator.addAbilityMonitor(monitor);
    try {
      await delegator.startAbility({ bundleName: BUNDLE_NAME, moduleName: ENTRY_MODULE, abilityName: ENTRY_ABILITY });
      return await withinDeadline(stageReady, 'The entry WindowStage was not created');
    } finally {
      await delegator.removeAbilityMonitor(monitor);
    }
  }
}
