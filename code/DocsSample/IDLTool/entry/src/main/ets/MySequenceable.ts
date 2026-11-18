/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

// [Start idl_ts_sequenceable]
import { rpc } from '@kit.IPCKit';

export default class MySequenceable implements rpc.Parcelable {
  constructor(num: number, str: string) {
    this.num = num;
    this.str = str;
  }
  getNum() : number {
    return this.num;
  }
  getString() : string {
    return this.str;
  }
  marshalling(messageParcel: rpc.MessageSequence): boolean {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    return true;
  }
  unmarshalling(messageParcel: rpc.MessageSequence): boolean {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    return true;
  }
  private num: number;
  private str: string;
}
// [End idl_ts_sequenceable]
