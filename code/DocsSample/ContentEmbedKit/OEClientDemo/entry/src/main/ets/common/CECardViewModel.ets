/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { image } from '@kit.ImageKit';
import { CEProxy } from 'libentry.so';

/**
 * Thin @Observed view-model that mirrors ONLY the display fields a FileCard
 * needs, backed by a CEProxy. CEProxy is a NAPI object and not @Observed, so
 * FileCard cannot @ObjectLink it directly — this is the reactivity seam.
 *
 * IMPORTANT: every field read inside FileCard's build() MUST be @Track'ed.
 * Reading `proxy` (a non-@Track field) during render throws
 * "Illegal usage of not @Track'ed property 'proxy' on UI!" (code 140110).
 * The pixelmap returned by proxy.getSnapshot() is therefore mirrored into
 * the @Track `snapshotImage` field (set only in syncFromProxy, never read
 * from `proxy` during render).
 */
@Observed
export class CECardViewModel {
  public proxy: CEProxy;
  @Track public name: string;
  @Track public snapshotUri: string | undefined;
  @Track public hasSnapshotImage: boolean;
  @Track public snapshotImage: image.PixelMap | undefined;

  constructor(proxy: CEProxy) {
    this.proxy = proxy;
    this.name = proxy.getName();
    this.snapshotUri = proxy.getSnapshotUri();
    this.snapshotImage = proxy.getSnapshot();
    this.hasSnapshotImage = this.snapshotImage !== undefined;
  }

  /** Re-read display fields from the proxy after a refresh(). Mutating the
   *  @Track fields here triggers FileCard re-render via @ObjectLink. The
   *  proxy itself is only touched here (off the render path). */
  syncFromProxy(): void {
    this.name = this.proxy.getName();
    this.snapshotUri = this.proxy.getSnapshotUri();
    this.snapshotImage = this.proxy.getSnapshot();
    this.hasSnapshotImage = this.snapshotImage !== undefined;
  }
}
