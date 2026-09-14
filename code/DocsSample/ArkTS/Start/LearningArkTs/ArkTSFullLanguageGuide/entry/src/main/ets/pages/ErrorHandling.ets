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

export {}

// ===== divide_with_error_handling =====
// [Start divide_with_error_handling]
function divide(a: number, b: number): number {
  if (b === 0) {
    throw new Error('除数不能为零');
  }
  return a / b;
}

try {
  let result: number = divide(10, 0);
  console.info(`${result}`);
} catch (error) {
  console.error(`计算失败: ${(error as Error).message}`);
  // 提供默认值，实现容错
  let fallbackResult: number = 0;
  console.info(`使用默认值: ${fallbackResult}`);
}
// [End divide_with_error_handling]

// ===== error_object_properties =====
// [Start error_object_properties]
// 创建基本的错误对象
let error1: Error = new Error('这是一个错误');
let error2: Error = new Error(); // 可选的错误信息

// Error对象的属性
console.info(`${error1.name}`);      // 'Error'
console.info(`${error1.message}`);   // '这是一个错误'
console.info(`${error1.stack ?? '无堆栈信息'}`);     // 错误堆栈信息

// 抛出错误
function validateAge(age: number): void {
  if (age < 0 || age > 150) {
    throw new Error('年龄必须在 0 到 150 之间');
  }
}

try {
  validateAge(-5);
} catch (error) {
  console.error((error as Error).message);
}
// [End error_object_properties]

// ===== built_in_error_types =====
// [Start built_in_error_types]
// TypeError: 类型错误
function typeErrorExample(): void {
  let num: number = 10;
  throw new TypeError('期望字符串，但得到数字');
}

// RangeError: 范围错误
function rangeErrorExample(): void {
  throw new RangeError('数组索引超出范围');
}

// ReferenceError: 引用错误
function referenceErrorExample(): void {
  throw new ReferenceError('变量未定义');
}

// SyntaxError: 语法错误
function syntaxErrorExample(): void {
  throw new SyntaxError('JSON 字符串格式不正确');
}

// URIError: URI错误
function uriErrorExample(): void {
  throw new URIError('URI 编码错误');
}
// [End built_in_error_types]

// ===== custom_error_classes =====
// [Start custom_error_classes]
// 自定义业务错误类
class UserBusinessError extends Error {
  public code: number;
  public timestamp: Date;
  
  constructor(code: number, message: string) {
    super(message);
    this.name = 'BusinessError';
    this.code = code;
    this.timestamp = new Date();
  }
  
  public toString(): string {
    return `${this.name} [${this.code}]: ${this.message} at ${this.timestamp.toISOString()}`;
  }
}

// 自定义验证错误类
class UserValidationError extends Error {
  public field: string;
  public value: string | number | boolean;
  
  constructor(field: string, value: string | number | boolean, message: string) {
    super(message);
    this.name = 'ValidationError';
    this.field = field;
    this.value = value;
  }
}

// 使用自定义错误
function validateUser(username: string, age: number): void {
  if (username.length < 3) {
    throw new UserValidationError('username', username, '用户名长度至少为3个字符');
  }
  
  if (age < 18) {
    throw new UserBusinessError(1001, '用户年龄必须满18岁');
  }
}

try {
  validateUser('ab', 16);
} catch (error) {
  if (error instanceof UserValidationError) {
    console.error(`字段验证失败: ${error.field}, 值: ${error.value}, 原因: ${error.message}`);
  } else if (error instanceof UserBusinessError) {
    console.error(`业务错误: ${error.code}, ${error.message}`);
  }
}
// [End custom_error_classes]

// ===== detailed_error_class =====
// [Start detailed_error_class]
interface ErrorInfo {
  code: number;           // 错误码
  message: string;         // 错误描述
  details?: string;        // 详细信息
  stack?: string;          // 堆栈信息
  timestamp: Date;         // 错误发生时间
  context?: Map<string, string>; // 错误上下文
}

class DetailedError extends Error {
  public code: number;
  public details: string;
  public context: Map<string, string>;
  public timestamp: Date;
  
  constructor(
    code: number,
    message: string,
    details: string = '',
    context: Map<string, string> = new Map<string, string>()
  ) {
    super(message);
    this.name = 'DetailedError';
    this.code = code;
    this.details = details;
    this.context = context;
    this.timestamp = new Date();
  }
  
  public toErrorInfo(): ErrorInfo {
    return {
      code: this.code,
      message: this.message,
      details: this.details,
      stack: this.stack,
      timestamp: this.timestamp,
      context: this.context
    };
  }
}

// 使用示例
function processData(data: string): void {
  if (data.length === 0) {
    let context: Map<string, string> = new Map<string, string>();
    context.set('functionName', 'processData');
    context.set('inputParam', 'data');
    throw new DetailedError(
      1002,
      '数据为空',
      'processData 函数要求输入数据不能为空',
      context
    );
  }
}

try {
  processData('');
} catch (error) {
  if (error instanceof DetailedError) {
    let errorInfo: ErrorInfo = error.toErrorInfo();
    console.error(`错误码: ${errorInfo.code}`);
    console.error(`错误信息: ${errorInfo.message}`);
    console.error(`详细信息: ${errorInfo.details ?? ''}`);
    console.error(`上下文: ${errorInfo.context ? errorInfo.context.size : 0} 项`);
  }
}
// [End detailed_error_class]

// ===== try_catch_finally_syntax =====
// [Start try_catch_finally_syntax]
try {
  // 可能抛出异常的代码
} catch (error) {
  // 异常处理代码
} finally {
  // 无论是否发生异常都会执行的代码（可选）
}
// [End try_catch_finally_syntax]

// ===== try_catch_finally_example =====
// [Start try_catch_finally_example]
function divideNumbers(a: number, b: number): number {
  if (b === 0) {
    throw new Error('除数不能为零');
  }
  return a / b;
}

// 完整的try-catch-finally结构
function calculateExample(): void {
  console.info('开始计算');
  
  try {
    let result: number = divideNumbers(10, 0);
    console.info(`计算结果: ${result}`);
  } catch (error) {
    console.error(`捕获到错误: ${(error as Error).message}`);
  } finally {
    console.info('计算结束（无论成功与否都会执行）');
  }
}

calculateExample();
// 输出:
// 开始计算
// 捕获到错误: 除数不能为零
// 计算结束（无论成功与否都会执行）
// [End try_catch_finally_example]

// ===== error_type_discrimination =====
// [Start error_type_discrimination]
class NetworkError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NetworkError';
  }
}

class DatabaseError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'DatabaseError';
  }
}

function fetchData(source: string): string {
  if (source === 'network') {
    throw new NetworkError('网络连接失败');
  } else if (source === 'database') {
    throw new DatabaseError('数据库查询失败');
  } else {
    throw new Error('未知错误');
  }
}

function handleFetchData(source: string): void {
  try {
    let data = fetchData(source);
    console.info(`数据获取成功: ${data}`);
  } catch (error) {
    // 使用instanceof判断错误类型
    if (error instanceof NetworkError) {
      console.error(`网络错误: ${error.message}`);
      // 执行网络错误处理逻辑
      retryNetworkRequest();
    } else if (error instanceof DatabaseError) {
      console.error(`数据库错误: ${error.message}`);
      // 执行数据库错误处理逻辑
      logDatabaseError(error);
    } else {
      console.error(`未知错误: ${(error as Error).message}`);
    }
  }
}

function retryNetworkRequest(): void {
  console.info('重试网络请求...');
}

function logDatabaseError(error: DatabaseError): void {
  console.info(`记录数据库错误: ${error.message}`);
}

handleFetchData('network');  // 网络错误: 网络连接失败
handleFetchData('database'); // 数据库错误: 数据库查询失败
handleFetchData('other');    // 未知错误: 未知错误
// [End error_type_discrimination]

// ===== resource_cleanup_finally =====
// [Start resource_cleanup_finally]
class DemoResource {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
    console.info(`${name} 资源已创建`);
  }
  
  public use(): void {
    console.info(`${this.name} 资源正在使用`);
    throw new Error('使用资源时发生错误');
  }
  
  public cleanup(): void {
    console.info(`${this.name} 资源已清理`);
  }
}

function useResource(): void {
  let resource: DemoResource | null = null;
  
  try {
    resource = new DemoResource('数据库连接');
    resource.use();
  } catch (error) {
    console.error('捕获错误:', (error as Error).message);
  } finally {
    // 确保资源被清理
    if (resource) {
      resource.cleanup();
    }
  }
}

useResource();
// 输出:
// 数据库连接 资源已创建
// 数据库连接 资源正在使用
// 捕获错误: 使用资源时发生错误
// 数据库连接 资源已清理
// [End resource_cleanup_finally]

// ===== finally_with_return =====
// [Start finally_with_return]
function testFinally(): string {
  try {
    console.info('try 块');
    return 'return from try';
  } catch (error) {
    console.info('catch 块');
    return 'return from catch';
  } finally {
    console.info('finally 块');
    // finally块中不要使用return，会覆盖try/catch的返回值
  }
}

let result: string = testFinally();
console.info(`返回值: ${result}`);
// 输出:
// try块
// finally块
// 返回值: return from try
// [End finally_with_return]

// ===== email_validation =====
// [Start email_validation]
function validateEmail(email: string): void {
  let emailRegex: RegExp = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  
  if (!email) {
    throw new Error('邮箱地址不能为空');
  }
  
  if (!emailRegex.test(email)) {
    throw new Error(`无效的邮箱地址: ${email}`);
  }
}

try {
  validateEmail('invalid-email');
} catch (error) {
  console.error(`验证失败: ${(error as Error).message}`);
}
// [End email_validation]

// ===== custom_error_with_code =====
// [Start custom_error_with_code]
class AppError extends Error {
  public code: number;
  
  constructor(code: number, message: string) {
    super(message);
    this.name = 'AppError';
    this.code = code;
  }
}

function withdrawMoney(balance: number, amount: number): number {
  if (amount <= 0) {
    throw new AppError(1001, '取款金额必须大于零');
  }
  
  if (amount > balance) {
    throw new AppError(1002, '余额不足');
  }
  
  return balance - amount;
}

try {
  let newBalance: number = withdrawMoney(100, 200);
  console.info(`取款成功，余额: ${newBalance}`);
} catch (error) {
  if (error instanceof AppError) {
    console.error(`错误码: ${error.code}, 错误信息: ${error.message}`);
    // 根据错误码执行不同逻辑
    if (error.code === 1002) {
      console.info('建议: 请先存款或申请贷款');
    }
  }
}
// [End custom_error_with_code]

// ===== function_throws_documentation =====
// [Start function_throws_documentation]
/**
 * 除法运算
 * @param a 被除数
 * @param b 除数
 * @returns 商
 * @throws {Error} 当除数为零时抛出错误
 */
function documentationDivide(a: number, b: number): number {
  if (b === 0) {
    throw new Error('除数不能为零');
  }
  return a / b;
}

/**
 * 解析JSON字符串
 * @param jsonStr JSON字符串
 * @returns 解析后的对象
 * @throws {SyntaxError} 当JSON格式不正确时抛出错误
 */
function documentationParseJSON(jsonStr: string): Object {
  try {
    return JSON.parse(jsonStr) as Object;
  } catch (error) {
    throw new SyntaxError('JSON 字符串格式不正确');
  }
}
// [End function_throws_documentation]

// ===== result_type_pattern =====
// [Start result_type_pattern]
interface Result<T> {
  data: T | null;
  error: Error | null;
}

// 函数返回数据与错误
function parseJSONSafe(jsonStr: string): Result<Object> {
  try {
    let data: Object = JSON.parse(jsonStr) as Object;
    return {
      data: data,
      error: null
    };
  } catch (error) {
    return {
      data: null,
      error: error as Error
    };
  }
}

let parseResult: Result<Object> = parseJSONSafe('{"name": "Alice"}');

if (parseResult.error !== null) {
    console.error('解析失败:', parseResult.error.message);
} else {
    console.info(`解析成功: ${parseResult.data}`);
}

// 另一个示例
function patternDivideNumbers(a: number, b: number): Result<number> {
  if (b === 0) {
    return {
      data: null,
      error: new Error('除数不能为零')
    };
  }
  return {
    data: a / b,
    error: null
  };
}

let divideResult: Result<number> = patternDivideNumbers(10, 2);
if (divideResult.error !== null) {
    console.error('计算失败:', divideResult.error.message);
} else {
    console.info(`计算结果: ${divideResult.data}`);
}
// [End result_type_pattern]

// ===== optional_chaining_nullish_coalescing =====
// [Start optional_chaining_nullish_coalescing]
interface ErrorHandlingUserProfile {
  avatar?: string;
  bio?: string;
}

interface ErrorHandlingUser {
  id: number;
  name: string;
  email?: string;
  profile?: ErrorHandlingUserProfile;
}

function getUserEmail(user: ErrorHandlingUser | null): string {
  // 使用可选链和空值合并
  return user?.email ?? '未设置邮箱';
}

function getAvatar(user: ErrorHandlingUser | null): string {
  return user?.profile?.avatar ?? 'default-avatar.png';
}

// 示例
let errorUser1: ErrorHandlingUser = { id: 1, name: 'Alice' };
let errorUser2: ErrorHandlingUser = { id: 2, name: 'Bob', email: 'bob@example.com' };
let errorUser3: ErrorHandlingUser = {
  id: 3,
  name: 'Charlie',
  profile: { avatar: 'charlie.png', bio: 'Developer' }
};

console.info(`${getUserEmail(errorUser1)}`); // '未设置邮箱'
console.info(`${getUserEmail(errorUser2)}`); // 'bob@example.com'
console.info(`${getAvatar(errorUser1)}`);    // 'default-avatar.png'
console.info(`${getAvatar(errorUser3)}`);    // 'charlie.png'
// [End optional_chaining_nullish_coalescing]

// ===== promise_try_catch =====
// [Start promise_try_catch]
async function asyncOperation(): Promise<string> {
  // 模拟异步操作
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      let success = Math.random() > 0.5;
      if (success) {
        resolve('操作成功');
      } else {
        reject(new Error('操作失败'));
      }
    }, 1000);
  });
}

// 使用try-catch捕获异步错误
async function handleAsyncOperation(): Promise<void> {
  try {
    let result = await asyncOperation();
    console.info(`结果: ${result}`);
    } catch (error) {
    console.error('捕获异步错误:', (error as Error).message);
  }
}

handleAsyncOperation();
// [End promise_try_catch]

// ===== promise_catch_finally_chain =====
// [Start promise_catch_finally_chain]
// 使用Promise.catch() 捕获错误
function promiseErrorOperation(): Promise<string> {
  return Promise.resolve('success');
}

function promiseCatchExample(): void {
  promiseErrorOperation()
    .then((result: string): string => {
      console.info(`成功: ${result}`);
      return result.toUpperCase();
    })
    .then((upperResult: string): void => {
      console.info(`转换后: ${upperResult}`);
    })
    .catch((error: Error): void => {
      console.error(`捕获错误: ${error.message}`);
    })
    .finally((): void => {
      console.info('操作结束');
    });
}

promiseCatchExample();
// [End promise_catch_finally_chain]

// ===== serial_async_error_handling =====
// [Start serial_async_error_handling]
function serialAsyncOperation(stepName: string): Promise<string> {
  return Promise.resolve(`${stepName}完成`);
}

async function serialErrorHandling(): Promise<void> {
  let stepResults: string[] = [];
  
  try {
    // 第一步
    let step1: string = await serialAsyncOperation('第一步');
    stepResults.push(step1);
    
    // 第二步（依赖第一步）
    let step2: string = await serialAsyncOperation('第二步');
    stepResults.push(step2);
    
    // 第三步（依赖第二步）
    let step3: string = await serialAsyncOperation('第三步');
    stepResults.push(step3);
    
    console.info(`所有步骤成功: ${stepResults.join(', ')}`);
  } catch (error) {
    console.error(`步骤执行失败: ${(error as Error).message}`);
    console.info(`已完成的步骤: ${stepResults.join(', ')}`);
  }
}

serialErrorHandling();
// [End serial_async_error_handling]

// ===== retry_with_backoff =====
// [Start retry_with_backoff]
interface RetryExampleOptions {
  maxRetries: number;      // 最大重试次数
  delay: number;           // 重试间隔（毫秒）
  backoff?: boolean;       // 是否使用指数退避
}

async function retryExampleAsyncOperation<T>(
  operation: () => Promise<T>,
  options: RetryExampleOptions
): Promise<T> {
  let lastError: Error | null = null;
  
  for (let attempt = 0; attempt <= options.maxRetries; attempt++) {
    try {
      let result = await operation();
      console.info(`操作成功（第${attempt + 1}次尝试）`);
      return result;
    } catch (error) {
      lastError = error as Error;
      console.info(`第${attempt + 1}次尝试失败: ${lastError.message}`);
      
      if (attempt < options.maxRetries) {
        // 计算等待时间
        let waitTime = options.delay;
        if (options.backoff) {
          waitTime = options.delay * Math.pow(2, attempt);
        }
        
        console.info(`等待 ${waitTime}ms 后重试...`);
        await new Promise<void>((resolve: () => void) => setTimeout(resolve, waitTime));
      }
    }
  }
  
  throw new Error(`重试${options.maxRetries}次后仍然失败: ${lastError ? lastError.message : '未知错误'}`);
}

// 使用示例
let retryAttemptCount: number = 0;

async function retryExampleUnstableOperation(): Promise<string> {
  retryAttemptCount++;
  if (retryAttemptCount < 2) {
    throw new Error('操作失败');
  }
  return '操作成功';
}

async function testRetry(): Promise<void> {
  try {
    let result: string = await retryExampleAsyncOperation<string>(
      retryExampleUnstableOperation,
      { maxRetries: 3, delay: 10, backoff: true }
    );
    console.info(`最终结果: ${result}`);
  } catch (error) {
    console.error(`所有重试均失败: ${(error as Error).message}`);
  }
}

testRetry();
// [End retry_with_backoff]

// ===== service_fallback_pattern =====
// [Start service_fallback_pattern]
interface FallbackDataService {
  getData(): Promise<string>;
}

class PrimaryDataService implements FallbackDataService {
  async getData(): Promise<string> {
        // 模拟主服务可能失败
    throw new Error('主服务不可用');
  }
}

class SecondaryDataService implements FallbackDataService {
  async getData(): Promise<string> {
    return '备用服务数据';
  }
}

class ResilientDataFetcher {
  private primaryService: FallbackDataService;
  private fallbackService: FallbackDataService;
  
  constructor() {
    this.primaryService = new PrimaryDataService();
    this.fallbackService = new SecondaryDataService();
  }
  
  async fetchData(): Promise<string> {
    try {
      // 尝试使用主服务
      return await this.primaryService.getData();
    } catch (error) {
      console.info(`主服务失败，切换到备用服务: ${(error as Error).message}`);
      
      try {
        // 使用备用服务
        return await this.fallbackService.getData();
      } catch (fallbackError) {
        console.error(`备用服务也失败: ${(fallbackError as Error).message}`);
        // 返回默认数据
        return '默认数据';
      }
    }
  }
}

// 使用示例
async function runDataFetcherExample(): Promise<void> {
  let fetcher: ResilientDataFetcher = new ResilientDataFetcher();
  let data = await fetcher.fetchData();
  console.info(`获取的数据: ${data}`);
}

runDataFetcherExample();
// [End service_fallback_pattern]

// ===== error_handling_best_practices =====
// [Start error_handling_best_practices]
class SpecificError extends Error {}

function handleSpecificError(error: SpecificError): void {
  console.info(`特定错误: ${error.message}`);
}

function logError(error: Error): void {
  console.info(`记录错误: ${error.message}`);
}

// 反例：捕获所有异常但不处理
try {
  // some code
} catch (error) {
  // 什么都不做
}

// 反例：捕获异常后只打印日志
try {
  // some code
} catch (error) {
  console.info((error as Error).message); // 仅打印，不处理
}

// 推荐：正确的错误处理
try {
  // some code
} catch (error) {
  let currentError: Error = error as Error;
  if (currentError instanceof SpecificError) {
    // 处理特定错误
    handleSpecificError(currentError);
  } else {
    // 记录并上报未知错误
    logError(currentError);
    throw currentError; // 重新抛出
  }
}
// [End error_handling_best_practices]

// ===== async_error_handling_patterns =====
// [Start async_error_handling_patterns]
async function exampleFetchData(): Promise<string> {
  return 'data';
}

async function exampleProcessData(data: string): Promise<void> {
  console.info(`处理数据: ${data}`);
}

// 推荐：async/await + try-catch
async function goodAsyncExample(): Promise<void> {
  try {
    let data: string = await exampleFetchData();
    await exampleProcessData(data);
  } catch (error) {
    console.error(`处理失败: ${(error as Error).message}`);
    // 根据错误类型采取不同措施
  }
}

// 推荐：Promise链式错误处理
function goodPromiseExample(): void {
  exampleFetchData()
    .then((data: string): Promise<void> => exampleProcessData(data))
    .catch((error: Error): void => {
      console.error(`处理失败: ${error.message}`);
    });
}
// [End async_error_handling_patterns]

// [Start catch_unknown_type]
function cuProcessData(data: string): void {
  try {
    let parsed: number = Number.parseInt(data, 10);
    if (Number.isNaN(parsed)) {
      throw new Error(`Invalid number: ${data}`);
    }
    console.info(`Parsed: ${parsed}`);
  } catch (error) {
    // error类型不能直接访问.message
    if (error instanceof Error) {
      console.info(`Error: ${error.message}`);
    } else {
      console.info(`Unknown error: ${error}`);
    }
  }
}

cuProcessData('abc');  // Error: Invalid number: abc
// [End catch_unknown_type]

// [Start catch_specific_error]
class CsValidationError extends Error {
  public field: string;

  constructor(field: string, message: string) {
    super(message);
    this.field = field;
  }
}

class CsNetworkError extends Error {
  public statusCode: number;

  constructor(statusCode: number, message: string) {
    super(message);
    this.statusCode = statusCode;
  }
}

function csHandleRequest(url: string): void {
  try {
    if (url.length === 0) {
      throw new CsValidationError('url', 'URL cannot be empty');
    }
    throw new CsNetworkError(500, 'Server error');
  } catch (error) {
    if (error instanceof CsValidationError) {
      console.info(`验证错误 [${error.field}]: ${error.message}`);
    } else if (error instanceof CsNetworkError) {
      console.info(`网络错误 [${error.statusCode}]: ${error.message}`);
    } else if (error instanceof Error) {
      console.info(`未知错误: ${error.message}`);
    } else {
      console.info(`未知异常: ${error}`);
    }
  }
}

csHandleRequest('');  // 验证错误 [url]: URL cannot be empty
csHandleRequest('EXAMPLE_API_URL');  // 网络错误 [500]: Server error
// [End catch_specific_error]

// [Start assertion_function_alternative]
function afAssertDefined(value: string | null): string {
  if (value === null) {
    throw new Error('Value must be defined');
  }
  return value;
}

function afIsString(val: Object): boolean {
  return typeof val === 'string';
}

function afProcess(value: string | number): void {
  if (typeof value === 'string') {
    let v: string = afAssertDefined(value);
    console.info(`${v.toUpperCase()}`);
  } else {
    console.info(`${value.toString()}`);
  }
}

afProcess('hello');  // HELLO
afProcess(42);       // 42
// [End assertion_function_alternative]

// ===== async_await_error_handling =====
// [Start async_await_error_handling]
async function fetchUserData(userId: number): Promise<string> {
  try {
    if (userId <= 0) {
      throw new Error(`无效的用户ID: ${userId}`);
    }
    return `用户${userId}的数据`;
  } catch (error) {
    console.error(`获取用户数据失败: ${(error as Error).message}`);
    throw new Error((error as Error).message);
  }
}

async function aehMain(): Promise<void> {
  try {
    let user: string = await fetchUserData(1);
    console.info(`用户信息: ${user}`);
  } catch (error) {
    console.error(`主流程错误: ${(error as Error).message}`);
  }
}

aehMain();
// [End async_await_error_handling]

// ===== fallback_default_values =====
// [Start fallback_default_values]
interface FallbackData {
  name: string;
}

function safeParseJSON(jsonStr: string, defaultValue: FallbackData | null = null): FallbackData | null {
  try {
    let parsed: Object = JSON.parse(jsonStr);
    return parsed as FallbackData;
  } catch (error) {
    console.info(`JSON解析失败，使用默认值: ${(error as Error).message}`);
    return defaultValue;
  }
}

let fbData1: FallbackData | null = safeParseJSON('{"name": "Alice"}', { name: 'Unknown' });
console.info(`${JSON.stringify(fbData1)}`);  // {"name":"Alice"}

let fbData2: FallbackData | null = safeParseJSON('invalid json', { name: 'Unknown' });
console.info(`${JSON.stringify(fbData2)}`);  // {"name":"Unknown"}

function safeArrayAccess<T>(arr: T[], index: number, defaultValue: T): T {
  try {
    if (index >= 0 && index < arr.length) {
      return arr[index];
    }
    throw new Error('索引超出范围');
  } catch (error) {
    console.info(`数组访问失败，使用默认值: ${(error as Error).message}`);
    return defaultValue;
  }
}

let fbNumbers: number[] = [1, 2, 3];
console.info(`${safeArrayAccess(fbNumbers, 5, 0)}`); // 0（索引超出范围）
// [End fallback_default_values]

// ===== api_client_with_retry =====
// [Start api_client_with_retry]
interface RetryConfig {
  maxRetries: number;
  timeout: number;
}

class ApiClient {
  private baseUrl: string;
  private maxRetries: number;
  private timeout: number;

  constructor(baseUrl: string, config?: RetryConfig) {
    this.baseUrl = baseUrl;
    this.maxRetries = config?.maxRetries ?? 3;
    this.timeout = config?.timeout ?? 5000;
  }

  async get(endpoint: string): Promise<string> {
    let url: string = `${this.baseUrl}${endpoint}`;
    let lastError: Error | null = null;

    for (let attempt: number = 0; attempt <= this.maxRetries; attempt++) {
      try {
        let result: string = await this.mockRequest(url);
        return result;
      } catch (error) {
        lastError = error as Error;

        if (attempt < this.maxRetries) {
          console.info(`请求失败，第${attempt + 1}次重试...`);
          await this.delay(1000 * (attempt + 1));
        }
      }
    }

    throw new Error(`请求失败: ${lastError?.message}`);
  }

  private delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void): void => {
      setTimeout(() => resolve(), ms);
    });
  }

  private mockRequest(url: string): Promise<string> {
    return new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void): void => {
      setTimeout(() => {
        if (url.includes('error')) {
          reject(new Error('网络错误'));
        } else {
          resolve(`数据来自${url}`);
        }
      }, 100);
    });
  }
}

async function retryFetchUserInfo(): Promise<void> {
  let client: ApiClient = new ApiClient('EXAMPLE_API_URL', { maxRetries: 2, timeout: 3000 });

  try {
    let user: string = await client.get('/users/1');
    console.info(`用户信息: ${user}`);
  } catch (error) {
    console.error(`获取用户信息失败: ${(error as Error).message}`);
    console.info('使用默认用户信息');
  }
}

retryFetchUserInfo();
// [End api_client_with_retry]
