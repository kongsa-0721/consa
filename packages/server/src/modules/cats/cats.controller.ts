import {
	Controller,
	Get,
	Header,
	HttpStatus,
	Param,
	Query,
	Req,
	Res,
} from "@nestjs/common";
import { CatsService } from "./cats.service";
import { Request, Response } from "express";

@Controller("cats")
export class CatsController {
	constructor(private readonly catsService: CatsService) {}

	@Get("")
	@Header("Cache-Control", "no-store") // 设置response请求头
	getAllUsers(
		@Param("id") id: string, // 这里需要注名要展示的key
		@Query("age") age: number,
		@Req() request: Request,
		@Res() response: Response,
	): void {
		console.log("Can get request parameters", request.url, request.host);
		console.log("Can receive params", id);
		console.log("Can receive query", age, typeof age);
		response.setHeader("X-Custom-Header", "kongsa"); // 灵活的设置response请求头
		response.status(HttpStatus.OK);
		response.json(this.catsService.getCats()); // 函数自然结束 不需要return 函数类型改为void
	}
}
