import 'package:bloc/bloc.dart';
import 'package:flower_up_product/core/image_repo/image_repo.dart';
import 'package:flower_up_product/core/repos/products_repo.dart';
import 'package:flower_up_product/features/add_product/domin/entities/add_product_input.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(
      this.imageRepo,
      this.productsRepo)
      : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductEntites addProductinputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductinputEntity.image);

    result.fold( (f) {
      emit(AddProductFailure(f.message),
      );
    },
    (url) async{
      addProductinputEntity.imageUrl = url;
      var result = await productsRepo.addProduct(addProductinputEntity);
      result.fold( (f) {
        emit(AddProductFailure(f.message),
        );
      },
          (r) {
        emit(AddProductSuccess());
          });
    },
    );
   }
 }
