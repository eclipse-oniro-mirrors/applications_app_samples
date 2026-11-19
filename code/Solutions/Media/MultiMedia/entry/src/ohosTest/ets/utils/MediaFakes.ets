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

import type { fileIo } from '@kit.CoreFileKit';
import type { AsyncCallback } from '@kit.BasicServicesKit';
import type { photoAccessHelper } from '@kit.MediaLibraryKit';
import type common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import type { ValueType } from '@kit.ArkData';
import type {
  MediaClock, MediaFileOperations, MediaFileStat, MediaPhotoAsset, MediaFetchResult, MediaLibraryOperations
} from '../../../main/ets/model/MediaUtils';

export function mediaContext(path: string): common.UIAbilityContext {
  return { filesDir: path } as common.UIAbilityContext;
}

export interface MediaEquality {
  field: string;
  value: ValueType;
}

export class FakeMediaPredicates extends dataSharePredicates.DataSharePredicates {
  public equalities: MediaEquality[] = [];

  public equalTo(field: string, value: ValueType): dataSharePredicates.DataSharePredicates {
    this.equalities.push({ field: field, value: value });
    return this;
  }
}

export class MediaTrace {
  public events: string[] = [];

  public add(event: string): void {
    this.events.push(event);
  }

  public clear(): void {
    this.events = [];
  }
}

export class FakeMediaClock implements MediaClock {
  public date: string;
  public time: string;
  public dateCalls: number = 0;
  public timeCalls: number = 0;
  private trace: MediaTrace;

  constructor(trace: MediaTrace, date: string = '20261119', time: string = '080910') {
    this.trace = trace;
    this.date = date;
    this.time = time;
  }

  public getDate(): string {
    this.dateCalls++;
    this.trace.add('clock.date');
    return this.date;
  }

  public getTime(): string {
    this.timeCalls++;
    this.trace.add('clock.time');
    return this.time;
  }
}

export class FakeMediaDescriptor implements fileIo.File {
  public fd: number;
  public path: string;
  public name: string;
  private trace: MediaTrace;

  constructor(trace: MediaTrace, fd: number, path: string) {
    this.trace = trace;
    this.fd = fd;
    this.path = path;
    this.name = path.substring(path.lastIndexOf('/') + 1);
  }

  public getParent(): string {
    this.trace.add('descriptor.parent');
    return this.path.substring(0, this.path.lastIndexOf('/'));
  }

  public lock(exclusive?: boolean): Promise<void>;
  public lock(callback: AsyncCallback<void>): void;
  public lock(exclusive: boolean, callback: AsyncCallback<void>): void;
  public lock(exclusive: boolean | AsyncCallback<void> = false, callback?: AsyncCallback<void>): Promise<void> | void {
    this.trace.add(`descriptor.lock:${typeof exclusive === 'boolean' ? exclusive : false}`);
    const onLocked: AsyncCallback<void> | undefined = typeof exclusive === 'function' ? exclusive : callback;
    if (onLocked) {
      Promise.resolve().then((): void => onLocked(undefined, undefined));
      return;
    }
    return Promise.resolve();
  }

  public tryLock(exclusive: boolean = false): void {
    this.trace.add(`descriptor.tryLock:${exclusive}`);
  }

  public unlock(): void {
    this.trace.add('descriptor.unlock');
  }
}

export interface FakeMediaOpen {
  path: string;
  mode: number;
}

export interface FakeMediaRename {
  source: string;
  target: string;
}

export class FakeMediaFiles implements MediaFileOperations {
  public names: string[] = [];
  public mtimes: Map<string, number> = new Map<string, number>();
  public opens: FakeMediaOpen[] = [];
  public closes: number[] = [];
  public renames: FakeMediaRename[] = [];
  public lists: string[] = [];
  public stats: string[] = [];
  public unlinks: string[] = [];
  public descriptors: fileIo.File[] = [];
  public nextFd: number = 710;
  public openError: string = '';
  public closeError: string = '';
  public renameError: string = '';
  public listError: string = '';
  public statError: string = '';
  public statErrorPath: string = '';
  public unlinkError: string = '';
  private trace: MediaTrace;

  constructor(trace: MediaTrace) {
    this.trace = trace;
  }

  public openSync(path: string, mode: number): fileIo.File {
    this.opens.push({ path: path, mode: mode });
    this.trace.add('files.open');
    if (this.openError !== '') {
      throw new Error(this.openError);
    }
    const descriptor: fileIo.File = new FakeMediaDescriptor(this.trace, this.nextFd++, path);
    this.descriptors.push(descriptor);
    return descriptor;
  }

  public closeSync(fd: number): void {
    this.closes.push(fd);
    this.trace.add('files.close');
    if (this.closeError !== '') {
      throw new Error(this.closeError);
    }
  }

  public renameSync(source: string, target: string): void {
    this.renames.push({ source: source, target: target });
    this.trace.add('files.rename');
    if (this.renameError !== '') {
      throw new Error(this.renameError);
    }
    const sourceName = source.substring(source.lastIndexOf('/') + 1);
    const targetName = target.substring(target.lastIndexOf('/') + 1);
    const index = this.names.indexOf(sourceName);
    if (index >= 0) {
      this.names[index] = targetName;
    }
    const mtime = this.mtimes.get(source);
    if (mtime !== undefined) {
      this.mtimes.delete(source);
      this.mtimes.set(target, mtime);
    }
  }

  public listFileSync(path: string): string[] {
    this.lists.push(path);
    this.trace.add('files.list');
    if (this.listError !== '') {
      throw new Error(this.listError);
    }
    return this.names.slice();
  }

  public statSync(path: string): MediaFileStat {
    this.stats.push(path);
    this.trace.add('files.stat');
    if (this.statError !== '' && (this.statErrorPath === '' || this.statErrorPath === path)) {
      throw new Error(this.statError);
    }
    const mtime = this.mtimes.get(path);
    return { mtime: mtime === undefined ? 0 : mtime };
  }

  public unlinkSync(path: string): void {
    this.unlinks.push(path);
    this.trace.add('files.unlink');
    if (this.unlinkError !== '') {
      throw new Error(this.unlinkError);
    }
    const name = path.substring(path.lastIndexOf('/') + 1);
    const index = this.names.indexOf(name);
    if (index >= 0) {
      this.names.splice(index, 1);
    }
    this.mtimes.delete(path);
  }
}

export interface FakeMediaSet {
  member: string;
  value: string;
}

export class FakeMediaPhoto implements MediaPhotoAsset {
  public uri: string;
  public photoType: photoAccessHelper.PhotoType;
  public members: Map<string, photoAccessHelper.MemberType> = new Map<string, photoAccessHelper.MemberType>();
  public gets: string[] = [];
  public sets: FakeMediaSet[] = [];
  public commits: number = 0;
  public getError: string = '';
  public setError: string = '';
  public commitError: string = '';
  public committedDisplayName: string = '';
  private trace: MediaTrace;

  constructor(trace: MediaTrace, uri: string, type: photoAccessHelper.PhotoType, name: string) {
    this.trace = trace;
    this.uri = uri;
    this.photoType = type;
    this.members.set('display_name', name);
    this.members.set('duration', 0);
    this.members.set('date_added', 0);
  }

  public get(member: string): photoAccessHelper.MemberType {
    this.gets.push(member);
    this.trace.add('photo.get');
    if (this.getError !== '') {
      throw new Error(this.getError);
    }
    const value = this.members.get(member);
    return value === undefined ? 0 : value;
  }

  public set(member: string, value: string): void {
    this.sets.push({ member: member, value: value });
    this.trace.add('photo.set');
    if (this.setError !== '') {
      throw new Error(this.setError);
    }
    this.members.set(member, value);
  }

  public async commitModify(): Promise<void> {
    this.commits++;
    this.trace.add('photo.commit');
    if (this.commitError !== '') {
      throw new Error(this.commitError);
    }
    if (this.committedDisplayName !== '') {
      this.members.set('display_name', this.committedDisplayName);
    }
  }
}

export class FakeMediaFetch implements MediaFetchResult {
  public assets: MediaPhotoAsset[];
  public allCalls: number = 0;
  public closeCalls: number = 0;
  public allError: string = '';
  public closeError: string = '';
  private trace: MediaTrace;

  constructor(trace: MediaTrace, assets: MediaPhotoAsset[] = []) {
    this.trace = trace;
    this.assets = assets;
  }

  public async getAllObjects(): Promise<MediaPhotoAsset[]> {
    this.allCalls++;
    this.trace.add('fetch.all');
    if (this.allError !== '') {
      throw new Error(this.allError);
    }
    return this.assets.slice();
  }

  public close(): void {
    this.closeCalls++;
    this.trace.add('fetch.close');
    if (this.closeError !== '') {
      throw new Error(this.closeError);
    }
  }
}

export interface FakeMediaCreate {
  photoType: photoAccessHelper.PhotoType;
  extension: string;
}

export interface FakeMediaDelete {
  context: common.UIAbilityContext;
  uris: string[];
}

export class FakeMediaLibrary implements MediaLibraryOperations {
  public creates: FakeMediaCreate[] = [];
  public fetches: photoAccessHelper.FetchOptions[] = [];
  public deletes: FakeMediaDelete[] = [];
  public results: FakeMediaFetch[] = [];
  public resultIndex: number = 0;
  public createdUri: string = 'fake://media/generated';
  public createError: string = '';
  public fetchError: string = '';
  public deleteError: string = '';
  private trace: MediaTrace;

  constructor(trace: MediaTrace) {
    this.trace = trace;
  }

  public async createAsset(photoType: photoAccessHelper.PhotoType, extension: string): Promise<string> {
    this.creates.push({ photoType: photoType, extension: extension });
    this.trace.add('library.create');
    if (this.createError !== '') {
      throw new Error(this.createError);
    }
    return this.createdUri;
  }

  public async getAssets(options: photoAccessHelper.FetchOptions): Promise<MediaFetchResult> {
    this.fetches.push(options);
    this.trace.add('library.fetch');
    if (this.fetchError !== '') {
      throw new Error(this.fetchError);
    }
    if (this.results.length === 0) {
      throw new Error('Fake fetch result was not configured');
    }
    const index = Math.min(this.resultIndex++, this.results.length - 1);
    return this.results[index];
  }

  public async deleteAssets(context: common.UIAbilityContext, uris: string[]): Promise<void> {
    this.deletes.push({ context: context, uris: uris.slice() });
    this.trace.add('library.delete');
    if (this.deleteError !== '') {
      throw new Error(this.deleteError);
    }
  }
}
