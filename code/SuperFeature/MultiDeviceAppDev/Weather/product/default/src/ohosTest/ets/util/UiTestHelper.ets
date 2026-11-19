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

/**
 * Conservative UI probe helpers for the L2 suites.
 * Every probe converts a uitest query into a stable snapshot string so the
 * suites never crash when the target page is not on screen (TestAbility
 * hosts its own Index page) and stay runnable in parallel batches.
 * Snapshot grammar:
 *   'found:<detail>' - element resolved and the follow-up query succeeded
 *   'notfound'       - query completed but no matching element exists
 *   'ok:<detail>'    - driver/window level query succeeded
 *   'error'          - the underlying uitest call threw
 */
import { Driver, ON, On, Component, UiWindow, WindowFilter } from '@kit.TestKit'

function uiDriver(): Driver {
  return Driver.create()
}

export async function probeComponentType(id: string): Promise<string> {
  try {
    const comp: Component = await uiDriver().findComponent(ON.id(id))
    if (comp === undefined || comp === null) {
      return 'notfound'
    }
    const type: string = await comp.getType()
    return 'found:' + type
  } catch (err) {
    return 'error'
  }
}

export async function probeComponentBounds(id: string): Promise<string> {
  try {
    const comp: Component = await uiDriver().findComponent(ON.id(id))
    if (comp === undefined || comp === null) {
      return 'notfound'
    }
    const rect = await comp.getBounds()
    return `found:${rect.left},${rect.top},${rect.right},${rect.bottom}`
  } catch (err) {
    return 'error'
  }
}

export async function probeComponentsById(id: string): Promise<string> {
  try {
    const list: Array<Component> = await uiDriver().findComponents(ON.id(id))
    if (list === undefined || list === null) {
      return 'notfound'
    }
    return `found:${list.length}`
  } catch (err) {
    return 'error'
  }
}

export async function probeComponentsByType(type: string): Promise<string> {
  try {
    const list: Array<Component> = await uiDriver().findComponents(ON.type(type))
    if (list === undefined || list === null) {
      return 'notfound'
    }
    return `found:${list.length}`
  } catch (err) {
    return 'error'
  }
}

export async function probeComponentTypeByText(text: string): Promise<string> {
  try {
    const comp: Component = await uiDriver().findComponent(ON.text(text))
    if (comp === undefined || comp === null) {
      return 'notfound'
    }
    const type: string = await comp.getType()
    return 'found:' + type
  } catch (err) {
    return 'error'
  }
}

export async function probeComponentBoundsByOn(target: On): Promise<string> {
  try {
    const comp: Component = await uiDriver().findComponent(target)
    if (comp === undefined || comp === null) {
      return 'notfound'
    }
    const rect = await comp.getBounds()
    return `found:${rect.left},${rect.top},${rect.right},${rect.bottom}`
  } catch (err) {
    return 'error'
  }
}

export async function probeDisplaySize(): Promise<string> {
  try {
    const point = await uiDriver().getDisplaySize()
    if (point === undefined || point === null) {
      return 'notfound'
    }
    return `ok:${point.x},${point.y}`
  } catch (err) {
    return 'error'
  }
}

export async function probeActiveWindowMode(): Promise<string> {
  try {
    const filter: WindowFilter = { active: true }
    const win: UiWindow = await uiDriver().findWindow(filter)
    if (win === undefined || win === null) {
      return 'notfound'
    }
    const mode = await win.getWindowMode()
    return `ok:${mode}`
  } catch (err) {
    return 'error'
  }
}

export async function probeActiveWindowBounds(): Promise<string> {
  try {
    const filter: WindowFilter = { active: true }
    const win: UiWindow = await uiDriver().findWindow(filter)
    if (win === undefined || win === null) {
      return 'notfound'
    }
    const rect = await win.getBounds()
    return `ok:${rect.left},${rect.top},${rect.right},${rect.bottom}`
  } catch (err) {
    return 'error'
  }
}
