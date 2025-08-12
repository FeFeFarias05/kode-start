import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  final String searchText;

  const SearchBarWidget({
    Key? key,
    required this.onSearch,
    this.searchText = "Qual personagem deseja pesquisar?", //default
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: TextField(
        controller: _controller,
        style: const TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.w900, 
          color: Colors.black, 
        ),
        onChanged: (value) {
          widget.onSearch(value);
        },
        decoration: InputDecoration(
          hintText: widget.searchText, 
          hintStyle: TextStyle(
            color: AppColors.white, 
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
          prefixIcon: Icon(Icons.search_rounded, color: AppColors.white),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: AppColors.white),
                  onPressed: () {
                    _controller.clear();
                    widget.onSearch('');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: AppColors.searchBarColor,
        ),
      ),
    );
  }
}
