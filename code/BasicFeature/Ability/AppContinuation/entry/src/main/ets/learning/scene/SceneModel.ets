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

import { localize, registerLocaleCatalog } from '../../common/LocaleStrings';
/** Production business adapters. This protocol is separate from legacy text and the v3 learning preview. */
export const SCENE_PAYLOAD_KEY: string = 'com.example.appcontinuation.scene.v1';
export const SCENE_STORE_KEY: string = 'scene_workspace_v1';
export const SCENE_LIMIT: number = 26000;
export const SCENE_WORKSPACE_LIMIT: number = 250000;
export const REVISION_LIMIT: number = 1000000000;

export interface ReadingChapter {
  title: string;
  paragraphs: string[];
}

/** Local bundled reading material, not a transferred file or a fabricated remote URI. */
function createREADING_CHAPTERS(): ReadingChapter[] {
  return [
  { title: localize('ac_scenemodel_001'), paragraphs: [
    localize('ac_scenemodel_002'),
    localize('ac_scenemodel_003'),
    localize('ac_scenemodel_004')
  ] },
  { title: localize('ac_scenemodel_005'), paragraphs: [
    localize('ac_scenemodel_006'),
    localize('ac_scenemodel_007'),
    localize('ac_scenemodel_008')
  ] },
  { title: localize('ac_scenemodel_009'), paragraphs: [
    localize('ac_scenemodel_010'),
    localize('ac_scenemodel_011'),
    localize('ac_scenemodel_012')
  ] }
];
}

export const READING_CHAPTERS: ReadingChapter[] = createREADING_CHAPTERS();
registerLocaleCatalog((): void => {
  READING_CHAPTERS.splice(0, READING_CHAPTERS.length);
  createREADING_CHAPTERS().forEach((item: ReadingChapter): void => { READING_CHAPTERS.push(item); });
});

export interface NoteDraft {
  title: string;
  body: string;
  savedBody: string;
  savedTitle: string;
  savedSelectionStart: number;
  savedSelectionEnd: number;
  selectionStart: number;
  selectionEnd: number;
}

export interface ReadingBookmark {
  chapter: number;
  anchor: number;
}

export interface ReadingProgress {
  bookId: string;
  chapter: number;
  anchor: number;
  bookmarks: ReadingBookmark[];
}

export interface FormDraft {
  step: number;
  name: string;
  phone: string;
  address: string;
  note: string;
  agreed: boolean;
  savedStep: number;
  confirmed: boolean;
}

export interface SceneState {
  kind: string;
  note: NoteDraft;
  reading: ReadingProgress;
  form: FormDraft;
}

export interface SceneDocument {
  transferId: string;
  documentId: string;
  revision: number;
  state: SceneState;
}

export interface SceneRead {
  value: SceneDocument | undefined;
  reason: string;
}

export interface SceneWorkspace {
  version: number;
  active: string;
  documents: SceneDocument[];
  history: SceneDocument[];
}

export function emptyScene(kind: string = 'text'): SceneState {
  return {
    kind: kind,
    note: {
      title: '',
      body: '',
      savedBody: '',
      savedTitle: '',
      savedSelectionStart: 0,
      savedSelectionEnd: 0,
      selectionStart: 0,
      selectionEnd: 0
    },
    reading: { bookId: 'continuation-handbook-1', chapter: 0, anchor: 0, bookmarks: [] },
    form: {
      step: 0,
      name: '',
      phone: '',
      address: '',
      note: '',
      agreed: false,
      savedStep: 0,
      confirmed: false
    }
  };
}

export function copyScene(state: SceneState): SceneState {
  return JSON.parse(JSON.stringify(state)) as SceneState;
}

export function validUnicode(text: string): boolean {
  for (let i: number = 0; i < text.length; i++) {
    const code: number = text.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF) {
      if (++i >= text.length) { return false; }
      const next: number = text.charCodeAt(i);
      if (next < 0xDC00 || next > 0xDFFF) { return false; }
    } else if (code >= 0xDC00 && code <= 0xDFFF) { return false; }
  }
  return true;
}

export function selectionBoundary(text: string, offset: number): boolean {
  if (!Number.isInteger(offset) || offset < 0 || offset > text.length) { return false; }
  if (offset > 0 && offset < text.length) {
    const code: number = text.charCodeAt(offset);
    const previous: number = text.charCodeAt(offset - 1);
    if (code >= 0xDC00 && code <= 0xDFFF && previous >= 0xD800 && previous <= 0xDBFF) { return false; }
  }
  return true;
}

function objectBag(value: Object | null | undefined): Record<string, Object> | undefined {
  if (value === null || value === undefined || typeof value !== 'object' || Array.isArray(value)) { return undefined; }
  return value as Record<string, Object>;
}

function boundedText(value: Object | undefined, limit: number): boolean {
  return typeof value === 'string' && (value as string).length <= limit && validUnicode(value as string);
}

export function validReadingPosition(chapter: number, anchor: number): boolean {
  return Number.isInteger(chapter) && chapter >= 0 && chapter < READING_CHAPTERS.length &&
    Number.isInteger(anchor) && anchor >= 0 && anchor < READING_CHAPTERS[chapter].paragraphs.length;
}

/** Adapter owns business validation and wire representation; no SDK listener lives here. */
interface SceneAdapter {
  read(raw: Object): SceneState | undefined;
  data(state: SceneState): Object;
}

class NoteAdapter implements SceneAdapter {
  public read(raw: Object): SceneState | undefined {
    const bag = objectBag(raw);
    if (bag === undefined || !boundedText(bag['title'], 80) || !boundedText(bag['body'], 4096) ||
      !boundedText(bag['savedBody'], 4096) || typeof bag['selectionStart'] !== 'number' ||
      typeof bag['selectionEnd'] !== 'number') { return undefined; }
    const body = bag['body'] as string;
    const start = bag['selectionStart'] as number;
    const end = bag['selectionEnd'] as number;
    if (!selectionBoundary(body, start) || !selectionBoundary(body, end) || start > end) { return undefined; }
    const state = emptyScene('note');
    if (bag['savedTitle'] !== undefined && !boundedText(bag['savedTitle'], 80)) { return undefined; }
    const savedBody = bag['savedBody'] as string;
    const savedStart = bag['savedSelectionStart'] === undefined ? savedBody.length : bag['savedSelectionStart'];
    const savedEnd = bag['savedSelectionEnd'] === undefined ? savedBody.length : bag['savedSelectionEnd'];
    if (typeof savedStart !== 'number' || typeof savedEnd !== 'number' ||
      !selectionBoundary(savedBody, savedStart as number) || !selectionBoundary(savedBody, savedEnd as number) ||
      (savedStart as number) > (savedEnd as number)) { return undefined; }
    state.note = {
      title: bag['title'] as string,
      body: body,
      savedBody: savedBody,
      savedTitle: bag['savedTitle'] === undefined ? bag['title'] as string : bag['savedTitle'] as string,
      savedSelectionStart: savedStart as number,
      savedSelectionEnd: savedEnd as number,
      selectionStart: start,
      selectionEnd: end
    };
    return state;
  }

  public data(state: SceneState): Object { return state.note; }
}

class ReadingAdapter implements SceneAdapter {
  public read(raw: Object): SceneState | undefined {
    const bag = objectBag(raw);
    if (bag === undefined || bag['bookId'] !== 'continuation-handbook-1' ||
      typeof bag['chapter'] !== 'number' || typeof bag['anchor'] !== 'number' ||
      !validReadingPosition(bag['chapter'] as number, bag['anchor'] as number) ||
      !Array.isArray(bag['bookmarks']) || (bag['bookmarks'] as Object[]).length > 20) { return undefined; }
    const bookmarks: ReadingBookmark[] = [];
    for (const rawBookmark of bag['bookmarks'] as Object[]) {
      const bookmark = objectBag(rawBookmark);
      if (bookmark === undefined || typeof bookmark['chapter'] !== 'number' || typeof bookmark['anchor'] !== 'number' ||
        !validReadingPosition(bookmark['chapter'] as number, bookmark['anchor'] as number)) { return undefined; }
      const chapter = bookmark['chapter'] as number;
      const anchor = bookmark['anchor'] as number;
      if (bookmarks.some((item: ReadingBookmark): boolean => item.chapter === chapter && item.anchor === anchor)) {
        return undefined;
      }
      bookmarks.push({ chapter: chapter, anchor: anchor });
    }
    const state = emptyScene('reading');
    state.reading = { bookId: 'continuation-handbook-1', chapter: bag['chapter'] as number,
      anchor: bag['anchor'] as number, bookmarks: bookmarks };
    return state;
  }

  public data(state: SceneState): Object { return state.reading; }
}

/** 表单步骤标签。 */
function createFORM_STEPS(): string[] {
  return [localize('ac_scenemodel_013'), localize('ac_scenemodel_014'), localize('ac_scenemodel_015')];
}

export const FORM_STEPS: string[] = createFORM_STEPS();
registerLocaleCatalog((): void => {
  FORM_STEPS.splice(0, FORM_STEPS.length);
  createFORM_STEPS().forEach((item: string): void => { FORM_STEPS.push(item); });
});

export function validFormStep(step: number): boolean {
  return Number.isInteger(step) && step >= 0 && step < FORM_STEPS.length;
}

/** 单步校验：只返回该步骤需要修正的问题。 */
export function stepIssues(form: FormDraft, step: number): string[] {
  const issues: string[] = [];
  if (step === 0) {
    if (form.name.trim().length === 0) { issues.push(localize('ac_scenemodel_016')); }
    if (form.name.length > 40) { issues.push(localize('ac_scenemodel_017')); }
    if (!/^1\d{10}$/.test(form.phone)) { issues.push(localize('ac_scenemodel_018')); }
  } else if (step === 1) {
    if (form.address.trim().length === 0) { issues.push(localize('ac_scenemodel_019')); }
    if (form.address.length > 100) { issues.push(localize('ac_scenemodel_020')); }
  } else {
    if (!form.agreed) { issues.push(localize('ac_scenemodel_021')); }
    if (form.note.length > 200) { issues.push(localize('ac_scenemodel_022')); }
  }
  return issues;
}

/** 整表校验：提交前必须全部通过。 */
export function formIssues(form: FormDraft): string[] {
  const issues: string[] = [];
  for (let step: number = 0; step < FORM_STEPS.length; step++) {
    stepIssues(form, step).forEach((issue: string): void => {
      issues.push(`${FORM_STEPS[step]}：${issue}`);
    });
  }
  return issues;
}

class FormAdapter implements SceneAdapter {
  public read(raw: Object): SceneState | undefined {
    const bag = objectBag(raw);
    if (bag === undefined || typeof bag['step'] !== 'number' || !validFormStep(bag['step'] as number) ||
      !boundedText(bag['name'], 40) || !boundedText(bag['phone'], 20) ||
      !boundedText(bag['address'], 100) || !boundedText(bag['note'], 200) ||
      typeof bag['agreed'] !== 'boolean') { return undefined; }
    const state = emptyScene('form');
    if (bag['savedStep'] !== undefined && (typeof bag['savedStep'] !== 'number' ||
      !validFormStep(bag['savedStep'] as number))) { return undefined; }
    if (bag['confirmed'] !== undefined && typeof bag['confirmed'] !== 'boolean') { return undefined; }
    state.form = {
      step: bag['step'] as number,
      name: bag['name'] as string,
      phone: bag['phone'] as string,
      address: bag['address'] as string,
      note: bag['note'] as string,
      agreed: bag['agreed'] as boolean,
      savedStep: bag['savedStep'] === undefined ? bag['step'] as number : bag['savedStep'] as number,
      confirmed: bag['confirmed'] === true
    };
    if (state.form.confirmed && formIssues(state.form).length > 0) { return undefined; }
    return state;
  }

  public data(state: SceneState): Object { return state.form; }
}

function adapter(kind: string): SceneAdapter | undefined {
  if (kind === 'note') { return new NoteAdapter(); }
  if (kind === 'reading') { return new ReadingAdapter(); }
  if (kind === 'form') { return new FormAdapter(); }
  return undefined;
}

export function sceneLabel(kind: string): string {
  return kind === 'note' ? localize('ac_notescenepage_002') : kind === 'reading' ? localize('ac_readingscenepage_002') :
    kind === 'form' ? localize('ac_formscenepage_002') : localize('ac_scenemodel_026');
}

export function encodeScene(document: SceneDocument): string {
  const selected = adapter(document.state.kind);
  if (selected === undefined) { throw new Error('Unsupported scene'); }
  return JSON.stringify({
    protocol: 'appcontinuation.scene',
    version: 1,
    transferId: document.transferId,
    documentId: document.documentId,
    revision: document.revision,
    scene: document.state.kind,
    state: selected.data(document.state)
  });
}

export function decodeScene(raw: Object | undefined): SceneRead {
  const rejected: SceneRead = { value: undefined, reason: localize('ac_scenemodel_027') };
  if (typeof raw !== 'string' || raw.length === 0 || raw.length > SCENE_LIMIT) { return rejected; }
  let parsed: Object | null = null;
  try { parsed = JSON.parse(raw as string) as Object; } catch (error) { return rejected; }
  const bag = objectBag(parsed);
  if (bag === undefined || bag['protocol'] !== 'appcontinuation.scene' || bag['version'] !== 1 ||
    typeof bag['transferId'] !== 'string' || !/^[A-Za-z0-9_-]{1,96}$/.test(bag['transferId'] as string) ||
    typeof bag['documentId'] !== 'string' || !/^[A-Za-z0-9_-]{1,64}$/.test(bag['documentId'] as string) ||
    typeof bag['revision'] !== 'number' || !Number.isInteger(bag['revision'] as number) ||
    (bag['revision'] as number) < 0 || (bag['revision'] as number) > REVISION_LIMIT ||
    typeof bag['scene'] !== 'string') {
    rejected.reason = localize('ac_scenemodel_028'); return rejected;
  }
  const selected = adapter(bag['scene'] as string);
  const state = selected === undefined || bag['state'] === undefined ? undefined : selected.read(bag['state']);
  if (state === undefined) { rejected.reason = localize('ac_scenemodel_029'); return rejected; }
  return { value: { transferId: bag['transferId'] as string, documentId: bag['documentId'] as string,
    revision: bag['revision'] as number, state: state }, reason: '' };
}

export function emptyWorkspace(): SceneWorkspace { return { version: 1, active: 'text', documents: [], history: [] }; }

export function findScene(workspace: SceneWorkspace, kind: string): SceneDocument | undefined {
  return workspace.documents.find((item: SceneDocument): boolean => item.state.kind === kind);
}

/** Stage a full workspace copy. Caller commits this copy only after a successful flush. */
export function stageScene(workspace: SceneWorkspace, document: SceneDocument, active: string): SceneWorkspace {
  const next = JSON.parse(JSON.stringify(workspace)) as SceneWorkspace;
  const old = findScene(next, document.state.kind);
  next.documents = next.documents.filter((item: SceneDocument): boolean => item.state.kind !== document.state.kind);
  next.documents.push(JSON.parse(JSON.stringify(document)) as SceneDocument);
  if (old !== undefined && old.documentId !== document.documentId) {
    next.history = next.history.filter((item: SceneDocument): boolean => item.state.kind !== document.state.kind);
  }
  if (old !== undefined && old.documentId === document.documentId && document.revision > old.revision) {
    next.history.push(old);
  }
  const matching = next.history.filter((item: SceneDocument): boolean => item.state.kind === document.state.kind);
  const keep = matching.slice(-5);
  next.history = next.history
    .filter((item: SceneDocument): boolean => item.state.kind !== document.state.kind).concat(keep);
  next.active = active;
  return next;
}

export function encodeWorkspace(workspace: SceneWorkspace): string {
  return JSON.stringify({ version: 1, active: workspace.active,
    documents: workspace.documents.map((item: SceneDocument): string => encodeScene(item)),
    history: workspace.history.map((item: SceneDocument): string => encodeScene(item)) });
}

export function decodeWorkspace(raw: Object): SceneWorkspace | undefined {
  if (typeof raw !== 'string' || raw.length > SCENE_WORKSPACE_LIMIT || raw.length === 0) { return undefined; }
  let parsed: Object | null = null;
  try { parsed = JSON.parse(raw as string) as Object; } catch (error) { return undefined; }
  const bag = objectBag(parsed);
  if (bag === undefined || bag['version'] !== 1 || typeof bag['active'] !== 'string' ||
    ['text', 'note', 'reading', 'form'].indexOf(bag['active'] as string) < 0 || !Array.isArray(bag['documents']) ||
    !Array.isArray(bag['history']) || (bag['documents'] as Object[]).length > 3 ||
    (bag['history'] as Object[]).length > 15) { return undefined; }
  const workspace = emptyWorkspace();
  workspace.active = bag['active'] as string;
  for (const rawDocument of bag['documents'] as Object[]) {
    const decoded = decodeScene(rawDocument).value;
    if (decoded === undefined || findScene(workspace, decoded.state.kind) !== undefined) { return undefined; }
    workspace.documents.push(decoded);
  }
  for (const rawHistory of bag['history'] as Object[]) {
    const decoded = decodeScene(rawHistory).value;
    const head = decoded === undefined ? undefined : findScene(workspace, decoded.state.kind);
    if (decoded === undefined || head === undefined || decoded.documentId !== head.documentId ||
      decoded.revision >= head.revision || workspace.history.filter((item: SceneDocument): boolean =>
      item.state.kind === decoded.state.kind).length >= 5) { return undefined; }
    workspace.history.push(decoded);
  }
  if (workspace.active !== 'text' && findScene(workspace, workspace.active) === undefined) { return undefined; }
  return workspace;
}
