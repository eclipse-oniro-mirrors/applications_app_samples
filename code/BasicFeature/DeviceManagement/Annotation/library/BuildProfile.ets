/**
 * Use these variables when you tailor your ArkTS code. They must be of the const type.
 */
export const HAR_VERSION = '1.0.0';
export const BUILD_MODE_NAME = 'test';
export const DEBUG = true;
export const TARGET_NAME = 'default';

/**
 * BuildProfile Class is used only for compatibility purposes.
 */
export default class BuildProfile { 
	public static readonly HAR_VERSION = HAR_VERSION;
	public static readonly BUILD_MODE_NAME = BUILD_MODE_NAME;
	public static readonly DEBUG = DEBUG;
	public static readonly TARGET_NAME = TARGET_NAME;
}