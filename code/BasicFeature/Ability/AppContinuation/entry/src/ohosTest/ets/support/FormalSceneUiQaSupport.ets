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

import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UiTestDriver as Driver, UiTestComponent as Component, UiTestSession, ON } from './UiTestRuntime';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { SceneBackupClipboard, SceneBackupClipboardPort } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { SceneDocument, decodeWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { BUNDLE } from './BoundedCase';
import { WaveSceneStore } from './ContinuationWaveOneFixtures';
import {
  FakeContinueNative, FakeLearningEnvironment, ManualLearningClock, MemoryLearningStore
} from './LearningFixtures';

const ABILITY_NAME: string = 'FormalSceneUiQaAbility';
const PAGE_NAME: string = 'FormalSceneUiQa';
const READY_ID: string = 'formal-scene-ui-qa-ready';
const ROOT_ID: string = 'formal-scene-ui-qa-root';
const CONTROL_LIMIT_MS: number = 3000;

/** No production Preferences, distributed service or system clipboard is used by this fixture. */
class FormalSceneUiQaClipboard implements SceneBackupClipboardPort {
  public async writeLocalText(_text: string): Promise<void> {
    throw new Error('Formal scene smoke does not permit clipboard operations');
  }
}

export function isFormalSceneUiQaScene(scene: string): boolean {
  return scene === 'text' || scene === 'note' || scene === 'reading' || scene === 'form';
}

export class FormalSceneUiQaFixture implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  public readonly textStore: MemoryLearningStore = new MemoryLearningStore();
  public readonly sceneStore: WaveSceneStore = new WaveSceneStore();
  public readonly controller: LearningController;
  public readonly scene: string;
  public readonly owner: common.UIAbilityContext;
  public readonly session: UiTestSession;
  private released: boolean = false;

  constructor(scene: string, owner: common.UIAbilityContext, session: UiTestSession) {
    if (!isFormalSceneUiQaScene(scene)) { throw new Error('Formal scene is not allowlisted'); }
    this.scene = scene;
    this.owner = owner;
    this.session = session;
    this.controller = new LearningController(undefined, this,
      new SceneBackupClipboard(new FormalSceneUiQaClipboard()), this.sceneStore);
  }

  public openStore(): LearningStore { return this.textStore; }

  public release(): void {
    if (this.released) { return; }
    this.released = true;
    // The harness passes this controller explicitly; it never replaces a production Ability's globals.
    try { this.controller.dispose(); } catch (error) { this.session.failCleanup('formal.controller'); }
    try { this.clock.clearAll(); } catch (error) { this.session.failCleanup('formal.clock'); }
  }
}

let activeFixture: FormalSceneUiQaFixture | undefined = undefined;

export function mountFormalSceneUiQa(scene: string, owner: common.UIAbilityContext,
  session: UiTestSession): FormalSceneUiQaFixture {
  session.requireLive();
  if (activeFixture !== undefined) { throw new Error('Another formal scene smoke fixture is still owned'); }
  const fixture = new FormalSceneUiQaFixture(scene, owner, session);
  activeFixture = fixture;
  return fixture;
}

export function currentFormalSceneUiQa(sessionId: string = ''): FormalSceneUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined || (sessionId.length > 0 && fixture.session.id !== sessionId)) {
    throw new Error('Formal scene UI fixture has not mounted for this session');
  }
  fixture.session.requireLive();
  return fixture;
}

export function failFormalSceneUiQaInitialization(sessionId: string, phase: string): void {
  const fixture = activeFixture;
  if (fixture !== undefined && fixture.session.id === sessionId) { fixture.session.failInitialization(phase); }
}

export function releaseFormalSceneUiQa(fixture: FormalSceneUiQaFixture): void {
  if (activeFixture === fixture) { activeFixture = undefined; }
  fixture.release();
}

function requireFormalSceneUiQaSession(driver: Driver, fixture: FormalSceneUiQaFixture): void {
  driver.session.requireLive();
  if (activeFixture !== fixture || fixture.session !== driver.session || !driver.session.owns(fixture.owner)) {
    throw new Error('Formal scene UI fixture ended; action cancelled');
  }
}

async function requireFormalSceneUiQaHost(driver: Driver, fixture: FormalSceneUiQaFixture,
  verifyRoot: boolean = false): Promise<void> {
  requireFormalSceneUiQaSession(driver, fixture);
  const top = await driver.session.guard(driver.session.call(() =>
    abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility(), 'AbilityDelegator.getCurrentTopAbility'));
  requireFormalSceneUiQaSession(driver, fixture);
  if (top === undefined || top === null || top.context.abilityInfo.bundleName !== BUNDLE ||
    top.context.abilityInfo.moduleName !== 'entry_test' || top.context.abilityInfo.name !== ABILITY_NAME) {
    throw new Error('Formal scene UI Ability is not the current host');
  }
  driver.session.verifyOwnedForeground(top.context);
  // Exact fixture/session identity and the active Ability are checked for every action.
  // The immutable session root is also verified at launch, not re-fetched before every click.
  if (!verifyRoot) { return; }
  const root = await driver.session.guard(driver.findComponent(ON.id(`${ROOT_ID}-${driver.session.id}`)));
  requireFormalSceneUiQaSession(driver, fixture);
  if (root === undefined) { throw new Error('Formal scene UI root is missing'); }
}

export async function formalSceneUiQaNode(driver: Driver, id: string): Promise<Component> {
  const fixture = currentFormalSceneUiQa(driver.session.id);
  requireFormalSceneUiQaSession(driver, fixture);
  let component = await driver.session.guard(driver.findComponent(ON.id(id)));
  if (component === undefined && driver.hasPendingTextInput()) {
    await driver.session.guard(requireFormalSceneUiQaHost(driver, fixture));
    await driver.session.guard(driver.finishTextInput());
    component = await driver.session.guard(driver.findComponent(ON.id(id)));
  }
  if (component === undefined) {
    const scroll = await driver.session.guard(driver.findComponent(ON.type('Scroll')));
    if (scroll !== undefined) { component = await driver.session.guard(scroll.scrollSearch(ON.id(id), component)); }
  }
  if (component === undefined) {
    component = await driver.session.guard(driver.waitForComponent(ON.id(id), CONTROL_LIMIT_MS));
  }
  requireFormalSceneUiQaSession(driver, fixture);
  if (component === undefined) { throw new Error(`Missing formal scene control: ${id}`); }
  return component;
}

export async function formalSceneUiQaText(driver: Driver, id: string): Promise<string> {
  const fixture = currentFormalSceneUiQa(driver.session.id);
  const text = await driver.session.guard((await driver.session.guard(formalSceneUiQaNode(driver, id))).getText());
  requireFormalSceneUiQaSession(driver, fixture);
  return text;
}

export async function formalSceneUiQaClick(driver: Driver, id: string): Promise<void> {
  const fixture = currentFormalSceneUiQa(driver.session.id);
  driver.session.enterPhase(`formal.click:${id}`);
  if (driver.hasPendingTextInput()) {
    await driver.session.guard(requireFormalSceneUiQaHost(driver, fixture));
    await driver.session.guard(driver.finishTextInput());
  }
  const component = await driver.session.guard(formalSceneUiQaNode(driver, id));
  await driver.session.guard(requireFormalSceneUiQaHost(driver, fixture));
  await driver.session.guard(component.click());
  // Do not demand whole-screen idle: caret/IME animation is unrelated to this action's result.
  await driver.session.pause(50);
  requireFormalSceneUiQaSession(driver, fixture);
}

export async function formalSceneUiQaInput(driver: Driver, id: string, value: string): Promise<void> {
  const fixture = currentFormalSceneUiQa(driver.session.id);
  driver.session.enterPhase(`formal.input:${id}`);
  const component = await driver.session.guard(formalSceneUiQaNode(driver, id));
  await driver.session.guard(requireFormalSceneUiQaHost(driver, fixture));
  const inputTarget = await driver.session.guard(component.inputTextTarget(value));
  await driver.session.guard(driver.waitForText(ON.id(id), value, CONTROL_LIMIT_MS, inputTarget));
  // Keep IME across adjacent input fields. Dismiss it before a button action or
  // when a lookup is occluded, rather than paying a hide/show animation per field.
  // Do not demand whole-screen idle: caret animation is unrelated to this action's result.
  await driver.session.pause(50);
  requireFormalSceneUiQaSession(driver, fixture);
}

export function formalSceneUiQaSavedScene(kind: string): SceneDocument {
  const workspace = decodeWorkspace(currentFormalSceneUiQa().sceneStore.stored());
  if (workspace === undefined) { throw new Error('Formal scene durable workspace is missing or invalid'); }
  const document = findScene(workspace, kind);
  if (document === undefined) { throw new Error('Formal scene durable document is missing'); }
  return document;
}

export async function launchFormalSceneUiQa(session: UiTestSession, scene: string): Promise<Driver> {
  session.enterPhase('formal.launch');
  if (!isFormalSceneUiQaScene(scene)) { throw new Error('Formal scene launch is not allowlisted'); }
  if (activeFixture !== undefined) { throw new Error('Previous formal scene UI Ability still owns a fixture'); }
  const driver = session.createDriver();
  await session.guard(driver.wakeUpDisplay());
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = PAGE_NAME;
  parameters['ownscene'] = scene;
  await session.guard(session.startAbility(BUNDLE, ABILITY_NAME, parameters));
  const ready = await session.guard(driver.waitForComponent(ON.id(`${READY_ID}-${session.id}`), CONTROL_LIMIT_MS));
  if (ready === undefined) { throw new Error('Formal scene UI harness is not ready'); }
  const fixture = currentFormalSceneUiQa(session.id);
  if (fixture.scene !== scene) { throw new Error('Formal scene UI harness selected the wrong scene'); }
  await session.guard(requireFormalSceneUiQaHost(driver, fixture, true));
  return driver;
}

export async function finishFormalSceneUiQa(session: UiTestSession): Promise<void> {
  await session.close();
}
