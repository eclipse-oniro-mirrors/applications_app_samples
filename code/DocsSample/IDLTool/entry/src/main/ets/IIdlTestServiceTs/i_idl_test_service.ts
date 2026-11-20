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

// [Start idl_ts_interface]
/**
 * TestIntTransaction方法的回调接口。
 */
export interface testIntTransactionCallback {
  (result: number, ret: number): void;
}

/**
 * TestStringTransaction方法的回调接口。
 */
export interface testStringTransactionCallback {
  (result: number): void;
}

/**
 * TestMapTransaction方法的回调接口。
 */
export interface testMapTransactionCallback {
  (result: number): void;
}

/**
 * TestArrayTransaction方法的回调接口。
 */
export interface testArrayTransactionCallback {
  (result: number, ret: number): void;
}

/**
 * IIdlTestService接口定义。
 */
export default interface IIdlTestService {
  /**
   * 测试整数类型事务。
   *
   * @param data 输入的整数数据。
   * @param callback 回调函数，返回执行结果和返回值。
   */
  testIntTransaction(data: number, callback: testIntTransactionCallback): void;

  /**
   * 测试字符串类型事务。
   *
   * @param data 输入的字符串数据。
   * @param callback 回调函数，返回执行结果。
   */
  testStringTransaction(data: string, callback: testStringTransactionCallback): void;

  /**
   * 测试Map类型事务。
   *
   * @param data 输入的Map数据。
   * @param callback 回调函数，返回执行结果。
   */
  testMapTransaction(data: Map<number, number>, callback: testMapTransactionCallback): void;

  /**
   * 测试数组类型事务。
   *
   * @param data 输入的字符串数组数据。
   * @param callback 回调函数，返回执行结果和返回值。
   */
  testArrayTransaction(data: string[], callback: testArrayTransactionCallback): void;
}
// [End idl_ts_interface]
