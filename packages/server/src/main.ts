import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { NestExpressApplication } from "@nestjs/platform-express";

async function bootstrap() {
	const app = await NestFactory.create<NestExpressApplication>(AppModule, {});
	await app.listen(8288, "0.0.0.0");
}

bootstrap().then(() => {
	console.log("Server is running on 0.0.0.0:8288");
});
