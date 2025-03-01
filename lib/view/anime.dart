import 'package:animechan/viewmodel/anime_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeQuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    Future.microtask(() => context.read<AnimeViewModel>().fetchQuote());

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Anime Quote'),
      ),
      body: Consumer<AnimeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(
                child: CircularProgressIndicator(
                    color: theme.colorScheme.primary));
          }
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                viewModel.errorMessage!,
                style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: screenWidth * 0.04),
                textAlign: TextAlign.center,
              ),
            );
          }
          if (viewModel.animeQuote == null) {
            return Center(
                child: Text('No data available',
                    style: TextStyle(fontSize: screenWidth * 0.04)));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02),
              child: Card(
                color: theme.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: theme.colorScheme.primary),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png",
                          width: screenWidth * 0.65),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        '" ${viewModel.animeQuote!.content} "',
                        style: TextStyle(
                            fontSize: 18, color: theme.colorScheme.onSurface),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        '- ${viewModel.animeQuote!.characterName}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        viewModel.animeQuote!.animeName.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
