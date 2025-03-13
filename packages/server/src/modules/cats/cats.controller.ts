import {
	Controller,
	Get,
	Post,
	Put,
	Delete,
	Req,
	Res,
	Header,
	HttpStatus,
	Param,
	Query,
	Body,
} from "@nestjs/common";
import { CatsService } from "./cats.service";
import { Request, Response } from "express";
import { AdoptionCatDto, UpdateCatDto } from "./cats.dto";

@Controller("cats")
export class CatsController {
	constructor(private readonly catsService: CatsService) {}

	@Get("")
	@Header("Cache-Control", "no-store")
	getCatsList(
		@Query("age") age: number,
		@Req() request: Request,
		@Res() response: Response,
	): void {
		response.setHeader("X-Cat-Age", request.host + " " + age);
		response.status(HttpStatus.OK);
		response.json(this.catsService.getCats()); // 函数自然结束 不需要return 函数类型改为void
	}

	@Get(":name")
	getCatById(@Param("name") name: string) {
		console.log("Can receive params", name);
		return this.catsService.getCatByName(name);
	}

	@Post("")
	AdoptionCats(@Body() adoptionCatDto: AdoptionCatDto) {
		return this.catsService.AdoptionCat(adoptionCatDto);
	}

	@Put(":name")
	updateCat(@Param("name") name: string, @Body() updateCatDto: UpdateCatDto) {
		return this.catsService.updateCat(name, updateCatDto);
	}

	@Delete(":name")
	deleteCat(@Param("name") name: string) {
		return this.catsService.deleteCat(name);
	}
}
